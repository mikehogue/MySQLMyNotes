CREATE TABLE MyNotesUser (
    UserName VARCHAR(50),
    Email VARCHAR(50),
    PRIMARY KEY(Email)
);

CREATE TABLE Creation (
    Email VARCHAR(50),
    CreationId INT AUTO_INCREMENT,
    PRIMARY KEY(CreationId),
    FOREIGN KEY(Email) REFERENCES MyNotesUser(Email)
);

CREATE TABLE Board (
    BoardName VARCHAR(50),
    CreationId INT,
    PRIMARY KEY(BoardName),
    FOREIGN KEY(CreationId) REFERENCES Creation(CreationId)
);

CREATE TABLE Subscribes (
    BoardName VARCHAR(50),
    Email VARCHAR(50),
    PRIMARY KEY(BoardName, Email),
    FOREIGN KEY(BoardName) REFERENCES Board(BoardName),
    FOREIGN KEY(Email) REFERENCES MyNotesUser(Email)
);

CREATE TABLE Card (
    BoardName VARCHAR(50),
    Task VARCHAR(500),
    Description VARCHAR(500),
    EndDate DATE,
    CreationId INT,
    PRIMARY KEY(CreationId),
    FOREIGN KEY(BoardName) REFERENCES Board(BoardName),
    FOREIGN KEY(CreationId) REFERENCES Creation(CreationId)
);

CREATE TABLE AssignedTo (
    Email VARCHAR(50),
    CreationId INT,
    PRIMARY KEY(Email, CreationId),
    FOREIGN KEY(Email) REFERENCES MyNotesUser(Email),
    FOREIGN KEY(CreationId) REFERENCES Creation(CreationId)
);
