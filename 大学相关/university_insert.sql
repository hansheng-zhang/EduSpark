USE `eduspark` ;

INSERT INTO `university` (`iduniversity`, `University_name`, `Branch_unniversity`, `Region`, `Location`, `QSranking`) VALUES
('01', 'Massachusetts Institute of Technology', FALSE, 'United States', 'Cambridge, MA, United States', '1'),
('02', 'Stanford', FALSE, 'United States', 'Stanford, CA, United States', '3'),
('03', 'University of Oxford', FALSE, 'United Kingdom', 'Oxford, ENG, United Kingdom', '4'),
('04', 'ETH Zurich - Swiss Federal Institute of Technology', FALSE, 'Switzerland', 'Zürich, Switzerland', '9'),
('05', 'National University of Singapore', FALSE, 'Singapore', 'Singapore, Singapore', '11'),
('06', 'Peking University', FALSE, 'China', 'Beijing, China', '12'),
('07', 'The University of Tokyo', FALSE, 'Japan', 'Tokyo, Japan', '23'),
('08', 'PSL Research University', FALSE, 'France', 'Paris, France', '26'),
('09', 'Australian National University', FALSE, 'Australia', 'Canberra, 01, Australia', '30'),
('10', 'McGill University', FALSE, 'Cannada', 'Montréal, Canada', '31');


INSERT INTO `uni_maj` (`Rank`, `UID`, `MID`, `Major_name`, `Major_type`, `Teaching_language`, `Major_scale`)
