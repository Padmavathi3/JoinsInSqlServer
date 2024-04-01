-- Person table creation
create table Person(
FirstName varchar(30),
LastName  varchar(30),
EmailId varchar(40) primary key,
Password varchar(50));

-- UserNote table creation
create table UserNote(
 NoteId varchar(20) primary key,
 Title varchar(40),
 Description varchar(200),
 reminder datetime,
 isArchive varchar(10),
 isPinned varchar(10),
 isTrash varchar(10),
 EmailId varchar(40)
 foreign key(EmailId) references Person(EmailId));

 -- Collaborators table creation
 create table Collaborators(
 CollaboratorId varchar(10) primary key,
 NoteId varchar(20),
 CollaboratorEmail varchar(40)
 foreign key(CollaboratorEmail) references Person(EmailId),
 foreign key(NoteId) references UserNote(NoteId));

 -- Label table creation
 create table Label(
 NoteId varchar(20),
 LabelName varchar(30),
 Email varchar(40),
 foreign key(NoteId) references UserNote(NoteId),
 foreign key(Email) references Person(EmailId));