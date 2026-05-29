use DoAn1_12524062_LeThanhLam

INSERT INTO TheLoai (TenTheLoai) VALUES
(N'Trinh thám'),      -- A1
(N'Khoa học'),        -- A2
(N'Kinh tế'),         -- A3
(N'Văn học'),         -- A4
(N'Thiếu nhi'),       -- A5

(N'Tâm lý'),          -- B1
(N'Lập trình'),       -- B2
(N'Lịch sử'),         -- B3
(N'Ngoại ngữ'),       -- B4
(N'Kỹ năng sống'),    -- B5

(N'Y học'),           -- C1
(N'Triết học'),       -- C2
(N'Giáo dục'),        -- C3
(N'Nghệ thuật'),      -- C4
(N'Du lịch');          -- C5

INSERT INTO TaiKhoan VALUES
('admin', '123', N'Admin', N'Quản trị hệ thống'),
('nv1', '123', N'NhanVien', N'Nguyễn Văn Nhân'),
('dg1', '123', N'DocGia', N'Lê Thanh Lâm'),
('dg2', '123', N'DocGia', N'Trần Thị Hoa');

INSERT INTO TheThuVien (Username, NgayHetHan, LoaiThe, PhiDangKy) VALUES
('dg1', DATEADD(YEAR, 1, GETDATE()), N'Năm', 200000),
('dg2', DATEADD(MONTH, 1, GETDATE()), N'Tháng', 30000);

INSERT INTO Sach VALUES
(N'The Murders in the Rue Morgue', N'Edgar Allan Poe', N'NXB Văn học', 1841, 1, 120000, 15, 'A1'),
(N'The Adventures of Sherlock Holmes', N'Arthur Conan Doyle', N'NXB Văn học', 1892, 1, 150000, 20, 'A1'),
(N'The Hound of the Baskervilles', N'Arthur Conan Doyle', N'NXB Văn học', 1902, 1, 140000, 18, 'A1'),
(N'Murder on the Orient Express', N'Agatha Christie', N'NXB Văn học', 1934, 1, 155000, 17, 'A1'),
(N'And Then There Were None', N'Agatha Christie', N'NXB Văn học', 1939, 1, 160000, 16, 'A1'),
(N'The Big Sleep', N'Raymond Chandler', N'NXB Văn học', 1939, 1, 150000, 15, 'A1'),
(N'Gone Girl', N'Gillian Flynn', N'NXB Hội Nhà Văn', 2012, 1, 165000, 15, 'A1');

INSERT INTO Sach VALUES
(N'On the Origin of Species', N'Charles Darwin', N'NXB Khoa học', 1859, 2, 200000, 15, 'A2'),
(N'A Brief History of Time', N'Stephen Hawking', N'NXB Khoa học', 1988, 2, 180000, 20, 'A2'),
(N'Cosmos', N'Carl Sagan', N'NXB Khoa học', 1980, 2, 175000, 18, 'A2'),
(N'The Selfish Gene', N'Richard Dawkins', N'NXB Khoa học', 1976, 2, 170000, 16, 'A2'),
(N'The Gene', N'Siddhartha Mukherjee', N'NXB Khoa học', 2016, 2, 190000, 15, 'A2'),
(N'Silent Spring', N'Rachel Carson', N'NXB Khoa học', 1962, 2, 160000, 15, 'A2'),
(N'The Elegant Universe', N'Brian Greene', N'NXB Khoa học', 1999, 2, 165000, 15, 'A2');

INSERT INTO Sach VALUES
(N'The Wealth of Nations', N'Adam Smith', N'NXB Kinh tế', 1800, 3, 200000, 15, 'A3'),
(N'Das Kapital', N'Karl Marx', N'NXB Chính trị', 1867, 3, 220000, 10, 'A3'),
(N'The General Theory', N'John Keynes', N'NXB Kinh tế', 1936, 3, 210000, 12, 'A3'),
(N'The Intelligent Investor', N'Benjamin Graham', N'NXB Tài chính', 1949, 3, 230000, 15, 'A3'),
(N'Capital in the 21st Century', N'Thomas Piketty', N'NXB Kinh tế', 2013, 3, 240000, 15, 'A3'),
(N'Freakonomics', N'Steven Levitt', N'NXB Kinh tế', 2005, 3, 180000, 18, 'A3'),
(N'Poor Economics', N'Banerjee', N'NXB Kinh tế', 2011, 3, 170000, 16, 'A3');

INSERT INTO Sach VALUES
(N'Pride and Prejudice', N'Jane Austen', N'NXB Văn học', 1813, 4, 150000, 20, 'A4'),
(N'Jane Eyre', N'Charlotte Bronte', N'NXB Văn học', 1847, 4, 150000, 18, 'A4'),
(N'Wuthering Heights', N'Emily Bronte', N'NXB Văn học', 1847, 4, 160000, 15, 'A4'),
(N'Les Miserables', N'Victor Hugo', N'NXB Văn học', 1862, 4, 200000, 15, 'A4'),
(N'War and Peace', N'Leo Tolstoy', N'NXB Văn học', 1869, 4, 220000, 10, 'A4'),
(N'Anna Karenina', N'Leo Tolstoy', N'NXB Văn học', 1877, 4, 210000, 12, 'A4'),
(N'Great Expectations', N'Charles Dickens', N'NXB Văn học', 1861, 4, 160000, 17, 'A4');

INSERT INTO Sach VALUES
(N'Alice in Wonderland', N'Lewis Carroll', N'NXB Kim Đồng', 1865, 5, 120000, 20, 'A5'),
(N'The Little Prince', N'Antoine de Saint-Exupery', N'NXB Kim Đồng', 1943, 5, 110000, 25, 'A5'),
(N'Charlotte Web', N'E.B White', N'NXB Kim Đồng', 1952, 5, 100000, 18, 'A5'),
(N'Harry Potter 1', N'J.K Rowling', N'NXB Trẻ', 1997, 5, 150000, 30, 'A5'),
(N'Peter Pan', N'J.M Barrie', N'NXB Kim Đồng', 1911, 5, 130000, 15, 'A5'),
(N'The Secret Garden', N'Frances Hodgson Burnett', N'NXB Kim Đồng', 1911, 5, 120000, 15, 'A5'),
(N'Anne of Green Gables', N'L.M Montgomery', N'NXB Kim Đồng', 1908, 5, 110000, 15, 'A5');

INSERT INTO Sach VALUES
(N'The Interpretation of Dreams', N'Sigmund Freud', N'NXB Tâm lý', 1899, 6, 180000, 15, 'B1'),
(N'Civilization and Its Discontents', N'Sigmund Freud', N'NXB Tâm lý', 1930, 6, 170000, 15, 'B1'),
(N'Man Search for Meaning', N'Viktor Frankl', N'NXB Tâm lý', 1946, 6, 160000, 20, 'B1'),
(N'Thinking Fast and Slow', N'Daniel Kahneman', N'NXB Tâm lý', 2011, 6, 200000, 18, 'B1'),
(N'The Power of Habit', N'Charles Duhigg', N'NXB Tâm lý', 2012, 6, 150000, 17, 'B1'),
(N'Flow', N'Mihaly Csikszentmihalyi', N'NXB Tâm lý', 1990, 6, 160000, 15, 'B1'),
(N'Emotional Intelligence', N'Daniel Goleman', N'NXB Tâm lý', 1995, 6, 170000, 16, 'B1');

INSERT INTO Sach VALUES
(N'Clean Code', N'Robert C. Martin', N'NXB CNTT', 2008, 7, 250000, 15, 'B2'),
(N'Design Patterns', N'Erich Gamma', N'NXB CNTT', 1994, 7, 270000, 10, 'B2'),
(N'Refactoring', N'Martin Fowler', N'NXB CNTT', 1999, 7, 260000, 12, 'B2'),
(N'The Pragmatic Programmer', N'Andrew Hunt', N'NXB CNTT', 1999, 7, 240000, 15, 'B2'),
(N'Code Complete', N'Steve McConnell', N'NXB CNTT', 2004, 7, 280000, 15, 'B2'),
(N'Introduction to Algorithms', N'Thomas H. Cormen', N'NXB CNTT', 2009, 7, 300000, 8, 'B2'),
(N'Artificial Intelligence: A Modern Approach', N'Stuart Russell', N'NXB CNTT', 2010, 7, 320000, 7, 'B2');

INSERT INTO Sach VALUES
(N'Sapiens: A Brief History of Humankind', N'Yuval Noah Harari', N'NXB Thế giới', 2011, 8, 200000, 20, 'B3'),
(N'Homo Deus', N'Yuval Noah Harari', N'NXB Thế giới', 2015, 8, 210000, 18, 'B3'),
(N'Guns, Germs, and Steel', N'Jared Diamond', N'NXB Thế giới', 1997, 8, 190000, 17, 'B3'),
(N'The History of the Peloponnesian War', N'Thucydides', N'NXB Lịch sử', 1874, 8, 180000, 10, 'B3'),
(N'The Second World War', N'Winston Churchill', N'NXB Lịch sử', 1948, 8, 220000, 12, 'B3'),
(N'A People History of the United States', N'Howard Zinn', N'NXB Lịch sử', 1980, 8, 200000, 15, 'B3'),
(N'The Silk Roads', N'Peter Frankopan', N'NXB Lịch sử', 2015, 8, 210000, 15, 'B3');

INSERT INTO Sach VALUES
(N'English Grammar in Use', N'Raymond Murphy', N'NXB Cambridge', 1985, 9, 120000, 30, 'B4'),
(N'Oxford Advanced Learner Dictionary', N'Oxford', N'NXB Oxford', 2000, 9, 300000, 15, 'B4'),
(N'Collins English Dictionary', N'Collins', N'NXB Collins', 2005, 9, 250000, 15, 'B4'),
(N'Practical English Usage', N'Michael Swan', N'NXB Oxford', 1995, 9, 200000, 15, 'B4'),
(N'English Vocabulary in Use', N'Michael McCarthy', N'NXB Cambridge', 1999, 9, 180000, 20, 'B4'),
(N'Cambridge IELTS Series', N'Cambridge', N'NXB Cambridge', 2010, 9, 150000, 25, 'B4'),
(N'Longman Dictionary of Contemporary English', N'Longman', N'NXB Pearson', 2003, 9, 280000, 15, 'B4');

INSERT INTO Sach VALUES
(N'How to Win Friends and Influence People', N'Dale Carnegie', N'NXB Trẻ', 1936, 10, 150000, 25, 'B5'),
(N'The 7 Habits of Highly Effective People', N'Stephen Covey', N'NXB Trẻ', 1989, 10, 180000, 20, 'B5'),
(N'Think and Grow Rich', N'Napoleon Hill', N'NXB Trẻ', 1937, 10, 160000, 20, 'B5'),
(N'The Alchemist', N'Paulo Coelho', N'NXB Văn học', 1988, 10, 140000, 25, 'B5'),
(N'Start With Why', N'Simon Sinek', N'NXB Trẻ', 2009, 10, 170000, 18, 'B5'),
(N'Deep Work', N'Cal Newport', N'NXB Trẻ', 2016, 10, 160000, 17, 'B5'),
(N'Atomic Habits', N'James Clear', N'NXB Trẻ', 2018, 10, 180000, 20, 'B5');

INSERT INTO Sach VALUES
(N'The Anatomy of Melancholy', N'Robert Burton', N'NXB Y học', 1850, 11, 180000, 10, 'C1'),
(N'Gray Anatomy', N'Henry Gray', N'NXB Y học', 1858, 11, 250000, 8, 'C1'),
(N'The Immortal Life of Henrietta Lacks', N'Rebecca Skloot', N'NXB Y học', 2010, 11, 180000, 15, 'C1'),
(N'Being Mortal', N'Atul Gawande', N'NXB Y học', 2014, 11, 170000, 15, 'C1'),
(N'When Breath Becomes Air', N'Paul Kalanithi', N'NXB Y học', 2016, 11, 160000, 18, 'C1'),
(N'The Man Who Mistook His Wife for a Hat', N'Oliver Sacks', N'NXB Y học', 1985, 11, 170000, 15, 'C1');

INSERT INTO Sach VALUES
(N'Critique of Pure Reason', N'Immanuel Kant', N'NXB Triết học', 1800, 12, 220000, 10, 'C2'),
(N'Phenomenology of Spirit', N'G.W.F Hegel', N'NXB Triết học', 1807, 12, 230000, 10, 'C2'),
(N'Thus Spoke Zarathustra', N'Friedrich Nietzsche', N'NXB Triết học', 1883, 12, 180000, 15, 'C2'),
(N'Being and Nothingness', N'Jean-Paul Sartre', N'NXB Triết học', 1943, 12, 200000, 12, 'C2'),
(N'The Republic', N'Plato', N'NXB Triết học', 1871, 12, 170000, 15, 'C2'),
(N'Meditations', N'Marcus Aurelius', N'NXB Triết học', 1860, 12, 150000, 18, 'C2'),
(N'Beyond Good and Evil', N'Friedrich Nietzsche', N'NXB Triết học', 1886, 12, 170000, 15, 'C2');

INSERT INTO Sach VALUES
(N'Democracy and Education', N'John Dewey', N'NXB Giáo dục', 1916, 13, 180000, 15, 'C3'),
(N'Pedagogy of the Oppressed', N'Paulo Freire', N'NXB Giáo dục', 1968, 13, 170000, 15, 'C3'),
(N'The Element', N'Ken Robinson', N'NXB Giáo dục', 2009, 13, 160000, 18, 'C3'),
(N'Outliers', N'Malcolm Gladwell', N'NXB Giáo dục', 2008, 13, 150000, 20, 'C3'),
(N'Mindset', N'Carol Dweck', N'NXB Giáo dục', 2006, 13, 160000, 20, 'C3'),
(N'Teaching to Transgress', N'Bell Hooks', N'NXB Giáo dục', 1994, 13, 150000, 15, 'C3');

INSERT INTO Sach VALUES
(N'The Story of Art', N'E.H. Gombrich', N'NXB Nghệ thuật', 1950, 14, 220000, 15, 'C4'),
(N'Ways of Seeing', N'John Berger', N'NXB Nghệ thuật', 1972, 14, 180000, 15, 'C4'),
(N'The Work of Art in the Age of Mechanical Reproduction', N'Walter Benjamin', N'NXB Nghệ thuật', 1936, 14, 170000, 10, 'C4'),
(N'Interaction of Color', N'Josef Albers', N'NXB Nghệ thuật', 1963, 14, 200000, 12, 'C4'),
(N'Art and Illusion', N'E.H. Gombrich', N'NXB Nghệ thuật', 1960, 14, 210000, 10, 'C4'),
(N'The Lives of the Artists', N'Giorgio Vasari', N'NXB Nghệ thuật', 1878, 14, 190000, 8, 'C4');

INSERT INTO Sach VALUES
(N'The Innocents Abroad', N'Mark Twain', N'NXB Du lịch', 1869, 15, 150000, 12, 'C5'),
(N'On the Road', N'Jack Kerouac', N'NXB Du lịch', 1957, 15, 160000, 15, 'C5'),
(N'Into the Wild', N'Jon Krakauer', N'NXB Du lịch', 1996, 15, 170000, 15, 'C5'),
(N'A Walk in the Woods', N'Bill Bryson', N'NXB Du lịch', 1998, 15, 160000, 15, 'C5'),
(N'Eat Pray Love', N'Elizabeth Gilbert', N'NXB Du lịch', 2006, 15, 150000, 20, 'C5'),
(N'The Geography of Bliss', N'Eric Weiner', N'NXB Du lịch', 2008, 15, 150000, 15, 'C5');

UPDATE Sach
SET MaTheLoai = 
    CASE 
        WHEN ViTriKe = 'A1' THEN 1
        WHEN ViTriKe = 'A2' THEN 2
        WHEN ViTriKe = 'A3' THEN 3
        WHEN ViTriKe = 'A4' THEN 4
        WHEN ViTriKe = 'A5' THEN 5
        WHEN ViTriKe = 'B1' THEN 6
        WHEN ViTriKe = 'B2' THEN 7
        WHEN ViTriKe = 'B3' THEN 8
        WHEN ViTriKe = 'B4' THEN 9
        WHEN ViTriKe = 'B5' THEN 10
        WHEN ViTriKe = 'C1' THEN 11
        WHEN ViTriKe = 'C2' THEN 12
        WHEN ViTriKe = 'C3' THEN 13
        WHEN ViTriKe = 'C4' THEN 14
        WHEN ViTriKe = 'C5' THEN 15
    END;


