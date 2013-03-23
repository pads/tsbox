CREATE USER 'tiddlyweb'@'localhost';
 
CREATE DATABASE tiddlyspace;
GRANT ALL PRIVILEGES ON tiddlyspace.* TO 'tiddlyweb'@'localhost';
quit