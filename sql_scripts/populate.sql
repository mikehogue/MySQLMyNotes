-- Add 45 users to the system

INSERT INTO MyNotesUser VALUES ('alston', 'alston@alston.com');
InSERT INTO MyNotesUser VALUES ('barnes', 'barnes@barnes.com');
InSERT INTO MyNotesUser VALUES ('brownie', 'brownie@brownie.com');
InSERT INTO MyNotesUser VALUES ('christabel', 'christabel@christabel.com');
InSERT INTO MyNotesUser VALUES ('christian', 'christian@christian.com');
InSERT INTO MyNotesUser VALUES ('clemmie', 'clemmie@clemmie.com');
InSERT INTO MyNotesUser VALUES ('curtiss', 'curtiss@curtiss.com');
InSERT INTO MyNotesUser VALUES ('emil', 'emil@emil.com');
InSERT INTO MyNotesUser VALUES ('eudora', 'eudora@eudora.com');
InSERT INTO MyNotesUser VALUES ('eulalie', 'eulalie@eulalie.com');
InSERT INTO MyNotesUser VALUES ('felice', 'felice@felice.com');
InSERT INTO MyNotesUser VALUES ('florencio', 'florencio@florencio.com');
InSERT INTO MyNotesUser VALUES ('forest', 'forest@forest.com');
InSERT INTO MyNotesUser VALUES ('georgene', 'georgene@georgene.com');
InSERT INTO MyNotesUser VALUES ('hammond', 'hammond@hammond.com');
InSERT INTO MyNotesUser VALUES ('harlin', 'harlin@harlin.com');
InSERT INTO MyNotesUser VALUES ('hewitt', 'hewitt@hewitt.com');
InSERT INTO MyNotesUser VALUES ('honore', 'honore@honore.com');
InSERT INTO MyNotesUser VALUES ('inza', 'inza@inza.com');
InSERT INTO MyNotesUser VALUES ('kay', 'kay@kay.com');
InSERT INTO MyNotesUser VALUES ('ladislav', 'ladislav@ladislav.com');
InSERT INTO MyNotesUser VALUES ('leda', 'leda@leda.com');
InSERT INTO MyNotesUser VALUES ('lenn', 'lenn@lenn.com');
InSERT INTO MyNotesUser VALUES ('linda', 'linda@linda.com');
InSERT INTO MyNotesUser VALUES ('lucine', 'lucine@lucine.com');
InSERT INTO MyNotesUser VALUES ('marcellus', 'marcellus@marcellus.com');
InSERT INTO MyNotesUser VALUES ('margarett', 'margarett@margarett.com');
InSERT INTO MyNotesUser VALUES ('marshel', 'marshel@marshel.com');
InSERT INTO MyNotesUser VALUES ('merna', 'merna@merna.com');
InSERT INTO MyNotesUser VALUES ('murphy', 'murphy@murphy.com');
InSERT INTO MyNotesUser VALUES ('nicola', 'nicola@nicola.com');
InSERT INTO MyNotesUser VALUES ('odessia', 'odessia@odessia.com');
InSERT INTO MyNotesUser VALUES ('onia', 'onia@onia.com');
InSERT INTO MyNotesUser VALUES ('raymond', 'raymond@raymond.com');
InSERT INTO MyNotesUser VALUES ('shelly', 'shelly@shelly.com');
InSERT INTO MyNotesUser VALUES ('stellar', 'stellar@stellar.com');
InSERT INTO MyNotesUser VALUES ('thomas', 'thomas@thomas.com');
InSERT INTO MyNotesUser VALUES ('toney', 'toney@toney.com');
InSERT INTO MyNotesUser VALUES ('wilbert', 'wilbert@wilbert.com');
InSERT INTO MyNotesUser VALUES ('zula', 'zula@zula.com');
-- begin repeat names
INSERT INTO MyNotesUser VALUES ('stellar', 'stellar2@stellar.com');
InSERT INTO MyNotesUser VALUES ('thomas', 'thomas2@thomas.com');
InSERT INTO MyNotesUser VALUES ('toney', 'toney2@toney.com');
InSERT INTO MyNotesUser VALUES ('wilbert', 'wilbert2@wilbert.com');
InSERT INTO MyNotesUser VALUES ('zula', 'zula2@zula.com');


-- insert 20 boards from 15 users
INSERT INTO Creation VALUES ('alston@alston.com', NULL);
INSERT INTO Board VALUES ('alston board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('barnes@barnes.com', NULL);
INSERT INTO Board VALUES ('barnes board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('brownie@brownie.com', NULL);
INSERT INTO Board VALUES ('brownie board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('christabel@christabel.com', NULL);
INSERT INTO Board VALUES ('christabel board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('christian@christian.com', NULL);
INSERT INTO Board VALUES ('christian board', LAST_INSERT_ID());

INSERT INTO Creation VALUES ('alston@alston.com', NULL);
INSERT INTO Board VALUES ('alston board2', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('barnes@barnes.com', NULL);
INSERT INTO Board VALUES ('barnes board2', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('brownie@brownie.com', NULL);
INSERT INTO Board VALUES ('brownie board2', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('christabel@christabel.com', NULL);
INSERT INTO Board VALUES ('christabel board2', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('christian@christian.com', NULL);
INSERT INTO Board VALUES ('christian board2', LAST_INSERT_ID());

INSERT INTO Creation VALUES ('clemmie@clemmie.com', NULL);
INSERT INTO Board VALUES ('clemmie board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('curtiss@curtiss.com', NULL);
INSERT INTO Board VALUES ('curtiss board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('emil@emil.com', NULL);
INSERT INTO Board VALUES ('emil board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('eudora@eudora.com', NULL);
INSERT INTO Board VALUES ('eudora board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('eulalie@eulalie.com', NULL);
INSERT INTO Board VALUES ('eulalie board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('felice@felice.com', NULL);
INSERT INTO Board VALUES ('felice board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('florencio@florencio.com', NULL);
INSERT INTO Board VALUES ('florencio board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('forest@forest.com', NULL);
INSERT INTO Board VALUES ('forest board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('georgene@georgene.com', NULL);
INSERT INTO Board VALUES ('georgene board', LAST_INSERT_ID());
INSERT INTO Creation VALUES ('hammond@hammond.com', NULL);
INSERT INTO Board VALUES ('hammond board', LAST_INSERT_ID());
-- end inserting boards

-- insert 50 cards
INSERT INTO Creation VALUES ('murphy@murphy.com', NULL);
INSERT INTO Card VALUES ('felice board', 'task01', 'description01', STR_TO_DATE('2014-03-20', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('florencio@florencio.com', NULL);
INSERT INTO Card VALUES ('brownie board', 'task02', 'description02', STR_TO_DATE('2013-09-26', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('ladislav@ladislav.com', NULL);
INSERT INTO Card VALUES ('barnes board', 'task03', 'description03', STR_TO_DATE('2013-01-19', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('harlin@harlin.com', NULL);
INSERT INTO Card VALUES ('alston board', 'task04', 'description04', STR_TO_DATE('2014-01-31', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('georgene@georgene.com', NULL);
INSERT INTO Card VALUES ('eulalie board', 'task05', 'description05', STR_TO_DATE('2013-09-11', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('christian@christian.com', NULL);
INSERT INTO Card VALUES ('emil board', 'task06', 'description06', STR_TO_DATE('2014-10-06', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('wilbert@wilbert.com', NULL);
INSERT INTO Card VALUES ('hammond board', 'task07', 'description07', STR_TO_DATE('2014-02-04', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('margarett@margarett.com', NULL);
INSERT INTO Card VALUES ('christian board', 'task08', 'description08', STR_TO_DATE('2013-03-20', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('harlin@harlin.com', NULL);
INSERT INTO Card VALUES ('florencio board', 'task09', 'description09', STR_TO_DATE('2014-07-13', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('nicola@nicola.com', NULL);
INSERT INTO Card VALUES ('eulalie board', 'task10', 'description10', STR_TO_DATE('2013-08-19', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('onia@onia.com', NULL);
INSERT INTO Card VALUES ('felice board', 'task11', 'description11', STR_TO_DATE('2014-03-23', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('marcellus@marcellus.com', NULL);
INSERT INTO Card VALUES ('georgene board', 'task12', 'description12', STR_TO_DATE('2013-03-08', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('hammond@hammond.com', NULL);
INSERT INTO Card VALUES ('curtiss board', 'task13', 'description13', STR_TO_DATE('2013-10-20', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('nicola@nicola.com', NULL);
INSERT INTO Card VALUES ('felice board', 'task14', 'description14', STR_TO_DATE('2014-07-22', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('curtiss@curtiss.com', NULL);
INSERT INTO Card VALUES ('barnes board', 'task15', 'description15', STR_TO_DATE('2014-10-10', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('brownie@brownie.com', NULL);
INSERT INTO Card VALUES ('eulalie board', 'task16', 'description16', STR_TO_DATE('2014-03-05', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('nicola@nicola.com', NULL);
INSERT INTO Card VALUES ('eudora board', 'task17', 'description17', STR_TO_DATE('2013-08-10', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('georgene@georgene.com', NULL);
INSERT INTO Card VALUES ('christian board', 'task18', 'description18', STR_TO_DATE('2013-02-23', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('felice@felice.com', NULL);
INSERT INTO Card VALUES ('barnes board', 'task19', 'description19', STR_TO_DATE('2014-11-10', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('ladislav@ladislav.com', NULL);
INSERT INTO Card VALUES ('christabel board', 'task20', 'description20', STR_TO_DATE('2013-12-19', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('eulalie@eulalie.com', NULL);
INSERT INTO Card VALUES ('curtiss board', 'task21', 'description21', STR_TO_DATE('2013-11-01', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('toney@toney.com', NULL);
INSERT INTO Card VALUES ('brownie board', 'task22', 'description22', STR_TO_DATE('2013-06-03', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('thomas@thomas.com', NULL);
INSERT INTO Card VALUES ('forest board', 'task23', 'description23', STR_TO_DATE('2013-04-10', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('raymond@raymond.com', NULL);
INSERT INTO Card VALUES ('felice board', 'task24', 'description24', STR_TO_DATE('2013-05-27', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('hammond@hammond.com', NULL);
INSERT INTO Card VALUES ('eudora board', 'task25', 'description25', STR_TO_DATE('2014-01-06', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('zula@zula.com', NULL);
INSERT INTO Card VALUES ('brownie board', 'task26', 'description26', STR_TO_DATE('2014-09-13', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('honore@honore.com', NULL);
INSERT INTO Card VALUES ('clemmie board', 'task27', 'description27', STR_TO_DATE('2013-01-04', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('lenn@lenn.com', NULL);
INSERT INTO Card VALUES ('eulalie board', 'task28', 'description28', STR_TO_DATE('2014-09-04', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('clemmie@clemmie.com', NULL);
INSERT INTO Card VALUES ('florencio board', 'task29', 'description29', STR_TO_DATE('2014-10-02', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('lucine@lucine.com', NULL);
INSERT INTO Card VALUES ('eudora board', 'task30', 'description30', STR_TO_DATE('2014-08-01', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('curtiss@curtiss.com', NULL);
INSERT INTO Card VALUES ('clemmie board', 'task31', 'description31', STR_TO_DATE('2013-08-06', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('eudora@eudora.com', NULL);
INSERT INTO Card VALUES ('florencio board', 'task32', 'description32', STR_TO_DATE('2014-05-14', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('odessia@odessia.com', NULL);
INSERT INTO Card VALUES ('christabel board', 'task33', 'description33', STR_TO_DATE('2013-12-18', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('lenn@lenn.com', NULL);
INSERT INTO Card VALUES ('felice board', 'task34', 'description34', STR_TO_DATE('2013-01-04', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('barnes@barnes.com', NULL);
INSERT INTO Card VALUES ('curtiss board', 'task35', 'description35', STR_TO_DATE('2013-10-11', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('honore@honore.com', NULL);
INSERT INTO Card VALUES ('florencio board', 'task36', 'description36', STR_TO_DATE('2013-04-14', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('shelly@shelly.com', NULL);
INSERT INTO Card VALUES ('christabel board', 'task37', 'description37', STR_TO_DATE('2014-10-02', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('clemmie@clemmie.com', NULL);
INSERT INTO Card VALUES ('brownie board', 'task38', 'description38', STR_TO_DATE('2014-06-27', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('stellar@stellar.com', NULL);
INSERT INTO Card VALUES ('georgene board', 'task39', 'description39', STR_TO_DATE('2013-03-08', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('leda@leda.com', NULL);
INSERT INTO Card VALUES ('forest board', 'task40', 'description40', STR_TO_DATE('2014-08-23', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('raymond@raymond.com', NULL);
INSERT INTO Card VALUES ('clemmie board', 'task41', 'description41', STR_TO_DATE('2014-10-22', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('alston@alston.com', NULL);
INSERT INTO Card VALUES ('christabel board', 'task42', 'description42', STR_TO_DATE('2013-02-24', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('florencio@florencio.com', NULL);
INSERT INTO Card VALUES ('eudora board', 'task43', 'description43', STR_TO_DATE('2014-09-21', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('lenn@lenn.com', NULL);
INSERT INTO Card VALUES ('eudora board', 'task44', 'description44', STR_TO_DATE('2013-04-15', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('linda@linda.com', NULL);
INSERT INTO Card VALUES ('georgene board', 'task45', 'description45', STR_TO_DATE('2013-12-26', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('toney@toney.com', NULL);
INSERT INTO Card VALUES ('eudora board', 'task46', 'description46', STR_TO_DATE('2014-01-03', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('leda@leda.com', NULL);
INSERT INTO Card VALUES ('florencio board', 'task47', 'description47', STR_TO_DATE('2013-12-21', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('forest@forest.com', NULL);
INSERT INTO Card VALUES ('christian board', 'task48', 'description48', STR_TO_DATE('2013-09-24', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('inza@inza.com', NULL);
INSERT INTO Card VALUES ('georgene board', 'task49', 'description49', STR_TO_DATE('2013-04-23', '%Y-%m-%d'), LAST_INSERT_ID());
INSERT INTO Creation VALUES ('onia@onia.com', NULL);
INSERT INTO Card VALUES ('eudora board', 'task50', 'description50', STR_TO_DATE('2013-05-05', '%Y-%m-%d'), LAST_INSERT_ID());
-- end insert cards

-- insert 25 subscriptions
INSERT INTO Subscribes VALUES ('alston board', 'barnes@barnes.com');
InSERT INTO Subscribes VALUES ('brownie board', 'lucine@lucine.com');
InSERT INTO Subscribes VALUES ('clemmie board', 'murphy@murphy.com');
InSERT INTO Subscribes VALUES ('eudora board', 'odessia@odessia.com');
InSERT INTO Subscribes VALUES ('forest board', 'hammond@hammond.com');
InSERT INTO Subscribes VALUES ('barnes board', 'murphy@murphy.com');
InSERT INTO Subscribes VALUES ('felice board', 'kay@kay.com');
InSERT INTO Subscribes VALUES ('barnes board', 'hammond@hammond.com');
InSERT INTO Subscribes VALUES ('christian board', 'raymond@raymond.com');
InSERT INTO Subscribes VALUES ('eulalie board', 'brownie@brownie.com');
InSERT INTO Subscribes VALUES ('christian board', 'nicola@nicola.com');
InSERT INTO Subscribes VALUES ('eudora board', 'toney@toney.com');
InSERT INTO Subscribes VALUES ('curtiss board', 'onia@onia.com');
InSERT INTO Subscribes VALUES ('felice board', 'toney@toney.com');
InSERT INTO Subscribes VALUES ('alston board', 'toney@toney.com');
InSERT INTO Subscribes VALUES ('hammond board', 'hammond@hammond.com');
InSERT INTO Subscribes VALUES ('clemmie board', 'barnes@barnes.com');
InSERT INTO Subscribes VALUES ('georgene board', 'forest@forest.com');
InSERT INTO Subscribes VALUES ('georgene board', 'marshel@marshel.com');
InSERT INTO Subscribes VALUES ('eudora board', 'eudora@eudora.com');
InSERT INTO Subscribes VALUES ('eulalie board', 'wilbert@wilbert.com');
InSERT INTO Subscribes VALUES ('forest board', 'felice@felice.com');
InSERT INTO Subscribes VALUES ('curtiss board', 'shelly@shelly.com');
InSERT INTO Subscribes VALUES ('felice board', 'barnes@barnes.com');
InSERT INTO Subscribes VALUES ('brownie board', 'merna@merna.com');
-- end insert subscriptions

-- insert 40 assignments
-- this could sometimes result in a collision, but it doesn't matter with dummy data
INSERT INTO AssignedTo VALUES ('christabel@christabel.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('stellar@stellar.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('inza@inza.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('wilbert@wilbert.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('christabel@christabel.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('zula@zula.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('christian@christian.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('raymond@raymond.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('inza@inza.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('toney@toney.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('onia@onia.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('onia@onia.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('margarett@margarett.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('barnes@barnes.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('felice@felice.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('leda@leda.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('marshel@marshel.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('odessia@odessia.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('brownie@brownie.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('shelly@shelly.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('forest@forest.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('kay@kay.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('marcellus@marcellus.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('alston@alston.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('ladislav@ladislav.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('lucine@lucine.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('emil@emil.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('felice@felice.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('nicola@nicola.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('christian@christian.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('lucine@lucine.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('harlin@harlin.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('georgene@georgene.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('georgene@georgene.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('marcellus@marcellus.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('leda@leda.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('clemmie@clemmie.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('brownie@brownie.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('odessia@odessia.com', round(RAND() * LAST_INSERT_ID()) + 1);
INSERT INTO AssignedTo VALUES ('nicola@nicola.com', round(RAND() * LAST_INSERT_ID()) + 1);
-- end insert assignments