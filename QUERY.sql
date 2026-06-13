-- Create table (Users)
CREATE TABLE Users (
    user_id int PRIMARY KEY,
    full_name varchar(100),
    email varchar(100) UNIQUE,
    role varchar(20),
    phone_number varchar(20),
    CHECK (role IN ('Ticket Manager', 'Football Fan'))
);

-- Create table (Matches)
CREATE TABLE Matches (
    match_id int PRIMARY KEY,
    fixture varchar(100),
    tournament_category varchar(100),
    base_ticket_price decimal(10, 2),
    match_status varchar(20),
    CHECK (
        match_status IN (
            'Available',
            'Selling Fast',
            'Sold Out',
            'Postponed'
        )
    )
);

-- Create table (Bookings)
CREATE TABLE Bookings (
    booking_id int PRIMARY KEY,
    user_id int REFERENCES Users (user_id),
    match_id int REFERENCES Matches (match_id),
    seat_number varchar(10),
    payment_status varchar(20),
    total_cost decimal(10, 2),
    CHECK (
        payment_status IN ('Pending', 'Confirmed', 'Cancelled', 'Refunded')
    )
);

-- Data insert into user table
INSERT INTO
    Users (user_id, full_name, email, role, phone_number)
VALUES
    (
        1,
        'Tanvir Rahman',
        'tanvir@mail.com',
        'Football Fan',
        '+8801711111111'
    ),
    (
        2,
        'Asif Haque',
        'asif@mail.com',
        'Football Fan',
        '+8801722222222'
    ),
    (
        3,
        'Sajjad Rahman',
        'sajjad@mail.com',
        'Ticket Manager',
        '+8801733333333'
    ),
    (
        4,
        'Jannat Ara',
        'jannat@mail.com',
        'Football Fan',
        NULL
    ),
    (
        5,
        'Rafi Ahmed',
        'rafi@mail.com',
        'Football Fan',
        '+8801744444444'
    ),
    (
        6,
        'Nusrat Jahan',
        'nusrat@mail.com',
        'Football Fan',
        '+8801755555555'
    ),
    (
        7,
        'Mehedi Hasan',
        'mehedi@mail.com',
        'Ticket Manager',
        '+8801766666666'
    ),
    (
        8,
        'Shakil Islam',
        'shakil@mail.com',
        'Football Fan',
        '+8801777777777'
    ),
    (
        9,
        'Mim Akter',
        'mim@mail.com',
        'Football Fan',
        '+8801788888888'
    ),
    (
        10,
        'Rakib Hossain',
        'rakib@mail.com',
        'Football Fan',
        '+8801799999999'
    ),
    (
        11,
        'Tania Sultana',
        'tania@mail.com',
        'Football Fan',
        '+8801701111111'
    ),
    (
        12,
        'Fahim Rahman',
        'fahim@mail.com',
        'Ticket Manager',
        '+8801702222222'
    ),
    (
        13,
        'Anika Islam',
        'anika@mail.com',
        'Football Fan',
        '+8801703333333'
    ),
    (
        14,
        'Sojib Mia',
        'sojib@mail.com',
        'Football Fan',
        '+8801704444444'
    ),
    (
        15,
        'Labiba Rahman',
        'labiba@mail.com',
        'Football Fan',
        '+8801705555555'
    );

-- Data insert into Matches
INSERT INTO
    Matches (
        match_id,
        fixture,
        tournament_category,
        base_ticket_price,
        match_status
    )
VALUES
    (
        101,
        'Real Madrid vs Barcelona',
        'Champions League',
        150.00,
        'Available'
    ),
    (
        102,
        'Man City vs Liverpool',
        'Premier League',
        120.00,
        'Selling Fast'
    ),
    (
        103,
        'Bayern Munich vs PSG',
        'Champions League',
        130.00,
        'Available'
    ),
    (
        104,
        'AC Milan vs Inter Milan',
        'Serie A',
        90.00,
        'Sold Out'
    ),
    (
        105,
        'Juventus vs Roma',
        'Serie A',
        80.00,
        'Available'
    ),
    (
        106,
        'Brazil vs Argentina',
        'FIFA World Cup',
        200.00,
        'Available'
    ),
    (
        107,
        'France vs Germany',
        'FIFA World Cup',
        180.00,
        'Selling Fast'
    ),
    (
        108,
        'England vs Spain',
        'FIFA World Cup',
        170.00,
        'Available'
    ),
    (
        109,
        'Portugal vs Netherlands',
        'FIFA World Cup',
        160.00,
        'Postponed'
    ),
    (
        110,
        'Uruguay vs Italy',
        'FIFA World Cup',
        140.00,
        'Available'
    );

-- Data insert into bookings
INSERT INTO
    Bookings (
        booking_id,
        user_id,
        match_id,
        seat_number,
        payment_status,
        total_cost
    )
VALUES
    (501, 1, 101, 'A-12', 'Confirmed', 150.00),
    (502, 1, 102, 'B-04', 'Pending', 120.00),
    (503, 2, 101, 'A-13', 'Confirmed', 150.00),
    (504, 2, 101, NULL, NULL, 150.00),
    (505, 3, 102, 'C-20', 'Pending', 120.00),
    (506, 4, 104, 'D-10', 'Refunded', 90.00),
    (507, 5, 105, 'E-05', NULL, 80.00),
    (508, 6, 106, 'F-01', 'Refunded', 200.00),
    (509, 7, 107, 'G-11', 'Pending', 180.00),
    (510, 8, 108, 'H-07', 'Confirmed', 170.00),
    (511, 9, 109, NULL, 'Cancelled', 160.00),
    (512, 10, 110, 'I-09', 'Confirmed', 140.00),
    (513, 11, 101, 'A-15', 'Pending', 150.00),
    (514, 12, 103, 'B-22', NULL, 130.00),
    (515, 13, 106, 'F-10', 'Confirmed', 200.00);

-- Queries
--= Query-1
SELECT
    match_id,
    fixture,
    round(base_ticket_price) AS base_ticket_price
FROM
    Matches
WHERE
    tournament_category = 'Champions League'
    AND match_status = 'Available';

--= Query-2
SELECT
    user_id,
    full_name,
    email
FROM
    Users
WHERE
    full_name ILIKE 'Tanvir%'
    OR full_name ILIKE '%Haque%';

--= Query-3
SELECT
    booking_id,
    user_id,
    match_id,
    coalesce(payment_status, 'Action Required') AS systematic_status
FROM
    Bookings
WHERE
    payment_status IS NULL;

--= Query-4
SELECT
    booking_id,
    full_name,
    fixture,
    total_cost
FROM
    Bookings
    INNER JOIN users USING (user_id)
    INNER JOIN matches USING (match_id);

--= Query-5
SELECT
    user_id,
    full_name,
    booking_id
FROM
    Users
    LEFT JOIN bookings USING (user_id);

--= Query-6
SELECT
    booking_id,
    match_id,
    round(total_cost) AS total_cost
FROM
    Bookings
WHERE
    total_cost > (
        SELECT
            avg(total_cost)
        FROM
            bookings
    );

--= Query-7
SELECT
    *
FROM
    Matches
ORDER BY
    base_ticket_price DESC
LIMIT
    2
OFFSET
    1;