try:
    square2 = Polygon(
        [
            [0, 0],
            [10, 0],
            [10, 10],
            [0, 10],
            [0, 0],
        ],
        srid=25832,
    )

    square3 = Polygon(
        [
            [0, 0, 0],
            [10, 0, 0],
            [10, 10, 0],
            [0, 10, 0],
            [0, 0, 0],
        ],
        srid=25832,
    )

    point2 = Point([0, 0], srid=25832)
    point3 = Point([0, 0, 0], srid=25832)
except NameError:
    pass
