CREATE TABLE Users (
  user_id INTEGER PRIMARY KEY AUTOINCREMENT,
  username TEXT NOT NULL,
  password TEXT NOT NULL,
  email TEXT NOT NULL,
  role TEXT NOT NULL,
  auth_method TEXT NOT NULL
);

CREATE TABLE Sessions (
  session_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  session_data TEXT NOT NULL,
  expiration_time DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);

CREATE TABLE Password_recovery (
  recovery_id INTEGER PRIMARY KEY AUTOINCREMENT,
  user_id INTEGER NOT NULL,
  recovery_code TEXT NOT NULL,
  expiration_time DATETIME NOT NULL,
  FOREIGN KEY (user_id) REFERENCES Users(user_id)
);
