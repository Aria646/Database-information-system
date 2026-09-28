DROP TABLE IF EXISTS Message;

CREATE TABLE Message (
  Id            INT          NOT NULL,
  Sender        VARCHAR(255) NOT NULL,
  Receiver      VARCHAR(255) NOT NULL,
  Message       VARCHAR(512) NOT NULL,
  IntegrityHash CHAR(64)     NOT NULL,
  PRIMARY KEY (Id),
  UNIQUE KEY uni_message_hash (IntegrityHash),
  KEY idx_msg_sender (Sender),
  KEY idx_msg_receiver (Receiver),
  CONSTRAINT fk_message_sender
    FOREIGN KEY (Sender)   REFERENCES User(Username),
  CONSTRAINT fk_message_receiver
    FOREIGN KEY (Receiver) REFERENCES User(Username),
  CONSTRAINT chk_sender_receiver_diff CHECK (Sender <> Receiver)
);
