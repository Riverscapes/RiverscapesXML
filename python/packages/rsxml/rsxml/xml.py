

def find_parent(element, root):
    """This is not efficient but it's a quick fix for now

    Args:
        element (_type_): _description_
        root (_type_): _description_

    Returns:
        _type_: _description_
    """
    for parent in root.iter():
        for child in parent:
            if child is element:
                return parent
    return None
