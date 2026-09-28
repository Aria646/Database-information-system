CREATE TABLE UserCreatesPost (
  Username    VARCHAR(255) NOT NULL,
  PostId      INT NOT NULL,
  PersonalNote TEXT,
  PRIMARY KEY (Username, PostId),
  CONSTRAINT fk_ucp_user FOREIGN KEY (Username) REFERENCES User(Username),
  CONSTRAINT fk_ucp_post FOREIGN KEY (PostId)   REFERENCES Post(Id)
);

INSERT INTO UserCreatesPost (Username, PostId, PersonalNote)
SELECT p.Username, p.Id, CONCAT(p.Username, ': ', p.Caption)
FROM Post p;
