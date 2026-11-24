import os
import json
import unittest
from pathlib import Path
# import sys
# import csv
from validate import get_xml, collect_files, get_xsd, validate_web_vector_json, validate_xml, validate_qramp, validate_qris_metric_json
from maplibre_expr import color_rgba, layer_render, referenced_fields
import QML2WebSymbology

PROJECT_DIR = Path(__file__).resolve().parent
REPO_ROOT = PROJECT_DIR.parent
os.chdir(REPO_ROOT)


# The two spellings a vector tile actually carries an NHD feature code under. A
# GeoPackage column reaches the tiles lower-cased; a shapefile or a view keeps
# the source spelling.  QGIS matches field names case-insensitively and MapLibre
# does not, which is the recurring breakage behind issues #1000, #1022, #1054.
FCODE_SPELLINGS = ('fcode', 'FCode')
FCODE_FIELDS = {'fcode', 'FCode', 'FCODE'}
# Not an FCode the repository uses anywhere, so no symbology should recognise it.
UNMATCHED_FCODE = 999999
# Web symbologies that are generated output: `python/QML2WebSymbology.py` has to
# keep reproducing them from the QGIS .qml they came from.  Hand-curated
# symbologies are deliberately not listed here - they are edited by hand.
GENERATED_SYMBOLOGIES = (
    'Shared/nhdintermittent',
    'Shared/flow_lines',
    'RSContext/nhdplusv2_flowlines',
    'VBET/dgo_flow_type',
)


def format_failures(failures):
    """Render a list of (name, message) failure pairs for an assert message."""
    shown = '\n'.join('  [{}] {}'.format(name, msg) for name, msg in failures[:15])
    if len(failures) > 15:
        shown += '\n  ... and {} more'.format(len(failures) - 15)
    return shown


def web_symbology_paths():
    return collect_files(root_path('Symbology/web/**/*.json'))


def load_symbology(path):
    with open(path, encoding='utf-8') as f:
        return json.load(f)


def layer_fields(layer):
    """Every attribute a layer reads, through its filter, paint or layout."""
    fields = set()
    for key in ('filter', 'paint', 'layout'):
        if layer.get(key) is not None:
            fields |= referenced_fields(layer[key])
    return fields


def fcode_layers(doc):
    """The layers that decide anything at all from an fcode."""
    return [layer for layer in doc['layerStyles'] if layer_fields(layer) & FCODE_FIELDS]


def render(doc, feature, zoom=12.0):
    """Everything ``doc`` actually draws for ``feature``, bottom layer first."""
    drawn = (layer_render(layer, feature, zoom) for layer in doc['layerStyles'])
    return tuple(spec for spec in drawn if spec is not None)


def probe(doc, value, spelling):
    """A feature carrying ``value`` as its fcode, with a value for every other field."""
    feature = {}
    for layer in doc['layerStyles']:
        for name in layer_fields(layer):
            if name.upper() != 'FCODE':
                feature[name] = 1
    feature[spelling] = value
    return feature


def mentioned_codes(doc):
    """Every integer code a symbology mentions, i.e. its category values."""
    found = set()

    def walk(node):
        if isinstance(node, list):
            for item in node:
                walk(item)
        elif isinstance(node, dict):
            for item in node.values():
                walk(item)
        elif isinstance(node, int) and not isinstance(node, bool) and 0 < node < 10 ** 6:
            found.add(node)

    walk(doc['layerStyles'])
    return sorted(found)


def root_path(relative: str) -> str:
    """Convert a repository-relative path into an absolute string."""
    return str(REPO_ROOT / relative)


# We do this mapping because we want the current version's XML tested against the corrent
# version's XSD.
XML_DIGEST = [
    {'xml': root_path('Programs/**/*.xml'), 'xsd': root_path('Program.xsd')},
    {'xml': root_path('RaveBusinessLogic/*.xml'), 'xsd': root_path('RaveBusinessLogic/XSD/project_explorer.xsd')},
    {'xml': root_path('RaveBusinessLogic/V2/*.xml'), 'xsd': root_path('RaveBusinessLogic/XSD/project_explorer.xsd')},
    {'xml': root_path('BaseMaps.xml'), 'xsd': root_path('BaseMaps.xsd')},
    {'xml': root_path('QRiS/protocols/*.xml'), 'xsd': root_path('QRiS/protocol.xsd')}
]


class TestLambdaFunc(unittest.TestCase):
    """
    Our basic test class
    """

    def err_helper(self, errors):
        """Helper function to format errors"""
        retval = ''
        for name, errstr in errors:
            retval += f'\n\n[{name}] :: {errstr}'
        return retval

    def test_xmls(self):
        """We have a bunch of XML files that need to be validated"""
        errors = []
        for xml_dig in XML_DIGEST:
            print(f"\nTesting XML Files with pattern {xml_dig['xml']}:\n===================================")
            xml_paths = collect_files(xml_dig['xml'])
            try:
                xsd_file = get_xsd(xml_dig['xsd'])
            except Exception as e:
                errors.append([xml_dig['xsd'], str(e)])
            for xml_path in xml_paths:
                try:
                    xml_file = get_xml(xml_path)
                    result, errs = validate_xml(xml_file, xsd_file)
                    if not result:
                        errors.append([xml_path, str(errs)])
                except Exception as e:
                    errors.append([xml_path, str(e)])
                print(f"Tested XML: {xml_path}")

        self.assertEqual(len(errors), 0, msg=f'Errors were found: \n{self.err_helper(errors)}')

    def test_validateJSON(self):
        """We have some JSON in the system that needs validating
        """
        errors = []

        print("\nTesting Web Symbologies:\n========================")
        with open(root_path('Symbology/web/vector.schema.json'), encoding='utf-8') as f:
            symbology_paths = collect_files(root_path('Symbology/web/**/*.json'))
            schema = json.load(f)

            for json_path in symbology_paths:
                try:
                    with open(json_path, 'r', encoding='utf-8') as f:
                        json_file = json.load(f)
                    result, errs = validate_web_vector_json(json_file, schema)
                    if not result:
                        errors.append([json_path, str(errs)])
                except Exception as e:
                    errors.append([json_path, str(e)])
                print(f"Tested web symbology: {json_path}")

        print("\nTesting QRiS Metrics:\n========================")
        with open(root_path('QRiS/qris_metrics.schema.json'), encoding='utf-8') as f:
            metric_paths = [
                *collect_files(root_path('QRiS/metrics/*.json')),
                *collect_files(root_path('QRiS/metrics/**/*.json')),
            ]
            schema = json.load(f)

            for json_path in metric_paths:
                try:
                    with open(json_path, 'r', encoding='utf-8') as f:
                        json_file = json.load(f)
                    result, errs = validate_qris_metric_json(json_file, schema)
                    if not result:
                        errors.append([json_path, str(errs)])
                except Exception as e:
                    errors.append([json_path, str(e)])
                print(f"Tested QRiS Metric: {json_path}")

        self.assertEqual(len(errors), 0, msg=f'Errors were found: \n{self.err_helper(errors)}')

    def test_validateRamp(self):
        """QGIS Color Ramps follow a very particular type
        """
        errors = []
        ramp_paths = collect_files(root_path('Symbology/web/**/*.txt'))
        for ramp_path in ramp_paths:
            try:
                with open(ramp_path, 'r', encoding='utf-8') as data:
                    ramp_file = data.read()
                result, errs = validate_qramp(ramp_file)
                if not result:
                    errors.append([ramp_path, str(errs)])
            except Exception as e:
                errors.append(
                    [ramp_path, f'Error parsing QGIS Color Ramp: {str(e)}'])

        self.assertEqual(len(errors), 0, msg=f'Errors were found: \n{self.err_helper(errors)}')

    def test_allProjectxmls(self):
        """Project XMLs need to be handled differently because each one has a different XSD file
        """

        for ver in ['V1', 'V2']:
            errors = []
            tested_xsds = []
            print(f"\nTesting Project XMLS {ver}:\n========================")
            xmls = collect_files(root_path(f'Projects/XSD/{ver}/examples/*.xml'))
            for xml_path in xmls:
                basename = os.path.basename(os.path.splitext(xml_path)[0])
                if ver == 'V1':
                    xsd_path = root_path(f'Projects/XSD/{ver}/{basename}.xsd')
                else:
                    xsd_path = root_path(f'Projects/XSD/{ver}/RiverscapesProject.xsd')
                xml_file = get_xml(xml_path)
                try:
                    # If there's no XSD for this project then just skip it for now
                    # This is because we can create example XMLS that do other things
                    print(f"Tested project xml: {xml_path}")
                    if not os.path.isfile(xsd_path):
                        continue
                    tested_xsds.append(xsd_path)
                    xsd_file = get_xsd(xsd_path)
                    result, errs = validate_xml(xml_file, xsd_file)
                    if not result:
                        errors.append([xml_path, str(errs)])
                except Exception as e:
                    errors.append([xml_path, str(e)])

            print(f"\nTesting Project XSDs {ver}:\n========================")
            self.assertEqual(len(errors), 0, msg=f'Errors were found: \n{self.err_helper(errors)}')
            for xsd_path in tested_xsds:
                print(f"Tested project xsd: {xsd_path}")


class TestWebSymbology(unittest.TestCase):
    """How a symbology renders must not depend on how the tile spells a field.

    Issue #1054: the Intermittent Drainage Network layer looked up `FCode`,
    the tiles carry `fcode`, so every flowline fell through to a grey default
    colour and the whole network was painted as a thin grey line.
    """

    def symbologies(self):
        for path in web_symbology_paths():
            try:
                doc = load_symbology(path)
            except Exception as e:
                self.fail('{} is not valid JSON: {}'.format(path, e))
            if isinstance(doc, dict) and doc.get('layerStyles') and fcode_layers(doc):
                yield path, doc

    def test_fcode_lookups_ignore_the_spelling(self):
        """A feature code must render the same as `fcode` and as `FCode`."""
        failures = []
        for path, doc in self.symbologies():
            for code in mentioned_codes(doc):
                renders = {s: render(doc, probe(doc, code, s)) for s in FCODE_SPELLINGS}
                if len(set(renders.values())) != 1:
                    failures.append((os.path.relpath(path, REPO_ROOT),
                                     'fcode={0} draws {1} but FCode={0} draws {2}'.format(
                                         code, renders['fcode'], renders['FCode'])))
        headline = 'These symbologies render differently depending on how the tile '
        self.assertEqual(len(failures), 0,
                         msg=headline + 'spells the field code:\n' + format_failures(failures))

    def test_uncategorised_fcodes_are_left_unpainted(self):
        """A renderer owns its categories and nothing else.

        Anything outside them has to be filtered out or fully transparent; a
        fallback colour paints features the symbology was never given a colour
        for, which is what turned the drainage network grey.
        """
        failures = []
        for path, doc in self.symbologies():
            for spelling in FCODE_SPELLINGS:
                feature = probe(doc, UNMATCHED_FCODE, spelling)
                painted = [layer['id'] for layer in fcode_layers(doc)
                           if layer_render(layer, feature) is not None]
                if painted:
                    failures.append((os.path.relpath(path, REPO_ROOT),
                                     '{}={} is painted by {}'.format(spelling, UNMATCHED_FCODE, painted)))
        headline = 'These symbologies paint a feature whose code they do not categorise:'
        self.assertEqual(len(failures), 0, msg=headline + '\n' + format_failures(failures))

    def test_a_legacy_colour_array_is_a_colour(self):
        """The style spec also allows `["rgba", 255, 170, 0, 1]`; VBET uses that."""
        self.assertEqual(color_rgba(['rgba', 255, 170, 0, 1]), (255.0, 170.0, 0.0, 1.0))
        self.assertEqual(color_rgba(['hsl', 0, 100, 50]), (255.0, 0.0, 0.0, 1.0))
        doc = load_symbology(root_path('Symbology/web/VBET/vbet_riverscape.json'))
        for level in (0, 1):
            feature = probe(doc, 46006, 'fcode')
            feature['level_path'] = level
            self.assertTrue(render(doc, feature),
                            msg='VBET draws nothing at level_path={}'.format(level))

    def test_every_qml_converts_to_one_consistent_tile_layer(self):
        """A sweep of the whole converter, not just the files we regenerate.

        Every layer in a generated file reads the tile layer the file is named
        after.  It used to read the QGIS *field* name (`"source-layer":
        "FCode"`), which is not a layer at all.
        """
        failures = []
        qml_dir = Path(root_path('Symbology/qgis'))
        qmls = sorted(qml_dir.rglob('*.qml'))
        self.assertGreater(len(qmls), 900, msg='the QGIS symbology library looks empty')
        for qml_path in qmls:
            rel = qml_path.relative_to(qml_dir)
            try:
                parsed = QML2WebSymbology.parse_qml(qml_path.read_text(encoding='utf-8'), str(qml_path))
                doc = QML2WebSymbology.build_json(parsed, qml_path.name)
            except Exception as e:
                failures.append((str(rel), 'raised {}: {}'.format(type(e).__name__, e)))
                continue
            if not doc:
                continue  # raster or nothing visible to draw - skipped by design
            tile_layers = sorted({layer['source-layer'] for layer in doc['layerStyles']})
            if tile_layers != [qml_path.stem]:
                failures.append((str(rel), 'reads tile layer(s) {} instead of {}'.format(
                    tile_layers, qml_path.stem)))
            ids = [layer['id'] for layer in doc['layerStyles']]
            if len(set(ids)) != len(ids):
                failures.append((str(rel), 'duplicate layer ids {}'.format(ids)))
            if '128,128,128' in json.dumps([layer.get('paint') for layer in doc['layerStyles']]):
                failures.append((str(rel), 'a paint keeps the grey fallback colour'))
        self.assertEqual(len(failures), 0, msg=(
            'The converter produced inconsistent output:\n' + format_failures(failures)))

    def test_generated_symbologies_still_match_the_converter(self):
        """Generated web symbologies must stay in step with their QGIS source.

        Hand-editing the JSON is what let the two drift apart in the first
        place; edit the .qml and regenerate instead.  Compared as parsed JSON,
        not bytes, so reformatting a file is not a failure.
        """
        failures = []
        for rel in GENERATED_SYMBOLOGIES:
            qml_path = Path(root_path('Symbology/qgis/{}.qml'.format(rel)))
            json_path = Path(root_path('Symbology/web/{}.json'.format(rel)))
            parsed = QML2WebSymbology.parse_qml(qml_path.read_text(encoding='utf-8'), str(qml_path))
            expected = QML2WebSymbology.build_json(parsed, qml_path.name)
            actual = load_symbology(str(json_path))
            if actual != expected:
                failures.append((rel, 'Symbology/web/{0}.json is not what '
                                 'python/QML2WebSymbology.py generates from '
                                 'Symbology/qgis/{0}.qml'.format(rel)))
        self.assertEqual(len(failures), 0, msg=format_failures(failures))


class TestQML2WebSymbology(unittest.TestCase):
    """The QGIS .qml to web symbology converter (issue #1054)."""

    def convert(self, rel):
        qml_path = Path(root_path('Symbology/qgis/{}.qml'.format(rel)))
        parsed = QML2WebSymbology.parse_qml(qml_path.read_text(encoding='utf-8'), str(qml_path))
        return QML2WebSymbology.build_json(parsed, qml_path.name)

    def test_field_expr_probes_every_spelling(self):
        expected = ['coalesce', ['get', 'FCode'], ['get', 'fcode'], ['get', 'FCODE']]
        for spelling in ('FCode', 'fcode', 'FCODE', 'Fcode'):
            self.assertEqual(QML2WebSymbology._field_expr(spelling), expected,
                             msg='field lookup for {!r} misses a spelling'.format(spelling))

    def test_other_fields_are_probed_by_case(self):
        self.assertEqual(QML2WebSymbology._field_expr('Type'),
                         ['coalesce', ['get', 'Type'], ['get', 'type'], ['get', 'TYPE']])
        self.assertEqual(QML2WebSymbology._field_expr(''), ['get', ''])

    def test_dash_array_is_scaled_to_the_line_width(self):
        opts = {'use_custom_dash': '1', 'customdash': '6;1;1;1;1;1;1;1',
                'customdash_unit': 'mm', 'line_width_unit': 'mm'}
        self.assertEqual(QML2WebSymbology._dash_array(opts, 0.75),
                         [8.0, 1.333, 1.333, 1.333, 1.333, 1.333, 1.333, 1.333])
        self.assertIsNone(QML2WebSymbology._dash_array({'customdash': '6;1'}, 1.0))

    def test_rule_filters_translate_or_are_dropped(self):
        self.assertIsNone(QML2WebSymbology._rule_filter('ELSE'))
        self.assertIsNone(QML2WebSymbology._rule_filter('   '))
        # An untranslatable filter drops the rule; it never becomes a wrong one.
        self.assertIs(QML2WebSymbology._rule_filter('concat("a", "b") = 1'), False)
        # QGIS spells equality '='; the style spec spells it '=='.
        self.assertEqual(QML2WebSymbology._rule_filter('"Type" = \'Chute\''),
                         ['==', ['coalesce', ['get', 'Type'], ['get', 'type'], ['get', 'TYPE']], 'Chute'])
        self.assertEqual(QML2WebSymbology._rule_filter('"Condition" > 0'),
                         ['>', ['coalesce', ['get', 'Condition'], ['get', 'condition'],
                                ['get', 'CONDITION']], 0])

    def test_categorized_symbol_only_paints_its_categories(self):
        """The intermittent layer: one filtered, dashed, light-blue line."""
        doc = self.convert('Shared/nhdintermittent')
        self.assertEqual(len(doc['layerStyles']), 1)
        layer = doc['layerStyles'][0]
        self.assertEqual(layer['filter'],
                         ['match', ['coalesce', ['get', 'FCode'], ['get', 'fcode'],
                                    ['get', 'FCODE']], [46003], True, False])
        self.assertEqual(layer['paint']['line-color'], 'rgb(115,222,255)')
        self.assertEqual(layer['paint']['line-dasharray'],
                         [8.0, 1.333, 1.333, 1.333, 1.333, 1.333, 1.333, 1.333])
        self.assertEqual(QML2WebSymbology._TRANSPARENT, 'rgba(0,0,0,0)')
        self.assertNotIn('128,128,128', json.dumps(doc))

    def test_one_layer_per_dash_pattern(self):
        """`line-dasharray` is not data-driven, so solid and dashed categories
        cannot share a layer without losing the dash."""
        doc = self.convert('Shared/flow_lines')
        self.assertGreater(len(doc['layerStyles']), 1)
        dashes = [json.dumps(layer['paint'].get('line-dasharray')) for layer in doc['layerStyles']]
        self.assertEqual(len(set(dashes)), len(dashes),
                         msg='two layers share a dash pattern: {}'.format(dashes))
        for layer in doc['layerStyles']:
            self.assertIn('filter', layer)

    def test_rule_renderer_gets_one_filtered_layer_per_rule(self):
        """Flattening a RuleRenderer to one colour painted the whole RSContext
        flowline network blue; every rule needs its own filtered layer."""
        doc = self.convert('RSContext/nhdplusv2_flowlines')
        self.assertGreater(len(doc['layerStyles']), 5)
        for layer in doc['layerStyles']:
            self.assertIn('filter', layer, msg='{} has no filter'.format(layer['id']))
            self.assertTrue(layer_fields(layer) & FCODE_FIELDS,
                            msg='{} does not look up a flowline code'.format(layer['id']))
        colours = json.dumps(doc)
        for code, colour in ((46006, 'rgb(0,77,168)'), (46003, 'rgb(115,222,255)'),
                             (33400, 'rgb(255,170,0)'), (33600, 'rgb(255,0,171)')):
            self.assertIn(colour, colours, msg='{} (fcode {}) lost its colour'.format(colour, code))


if __name__ == '__main__':
    unittest.main()
