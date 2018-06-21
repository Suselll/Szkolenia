import pymysql

class Szkolenia:

    def login(self):
        global login
        login = input('Podaj login: ')
        global haslo 
        haslo = input('Podaj hasło: ')
        self.c.execute('SELECT dostep FROM Logowanie WHERE login=%s AND haslo=%s', (login, haslo))
        try:
            dostep = self.c.fetchall()[0][0]
        except:
            dostep = '0'
        return dostep
    def connString(self):
        self.conn = pymysql.connect('localhost','serwer''hasło','Szkolenia')
        self.c = self.conn.cursor()
    def select(self):
        while(True):
            dec = input('Podaj numer: 1.Pokaż tabele, 2. Zakończ')
            if(dec == '1'):
                self.c.execute('SHOW TABLES;')
                for i,row in enumerate(self.c.fetchall()):
                    print('%i. %-15s' % (i+1, row[0]))
            elif(dec=='2'):
                break
            else:
                print('Niepoprawny wybór, spróbuj ponownie')
    def connClose(self):
        self.conn.close()

db = Szkolenia()