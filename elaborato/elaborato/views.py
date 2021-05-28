"""
Routes and views for the flask application.
"""

from datetime import datetime
from flask import render_template, Flask, request,  json, session, redirect
from elaborato import app
from flask_mysqldb import MySQL
from werkzeug.security import generate_password_hash, check_password_hash
from flask_session import Session
from elaborato.functions import *
 
# MySQL configurations
app.config['MYSQL_USER'] = 'root'
app.config['MYSQL_PASSWORD'] = 'leo123'
app.config['MYSQL_DB'] = 'elaborato'
app.config['MYSQL_HOST'] = 'localhost'
#Session configuration
app.config['SESSION_TYPE'] = 'filesystem'
app.config["SESSION_PERMANENT"] = False

#istanza sessione server side
Session(app)
#istanza del database
mysql = MySQL(app)

@app.route('/')
def home():
    #check if user is logged
    if isLogged():

        return render_template('index.html',login=True, mail=getIdCliente(),role=getRole())
        
    else:
        return render_template('index.html', login=False)

@app.route('/logout')
def logOut():
    session.clear()
    return redirect("/login")

#metodo che mostra la schermata di registrazione
@app.route('/signup', methods=['POST','GET'])
def signup():
    #se ho richiesta get mando pagine
    if request.method == 'GET':
        return render_template('signup.html')

    #se ricevo dati tramite richiesta post li processo
    if request.method == 'POST':
        _name = request.form['inputName']
        _surname = request.form['inputSurname']
        _tel = request.form['inputTel']
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']

        # validate the received values
        if _name and _email and _password:

            cur = mysql.connection.cursor()
            hashed_password = generate_password_hash(_password)
            cur.callproc('sp_createClient',[_name,_surname,_tel,_email,hashed_password])
            data = cur.fetchall()
            if len(data) is 0:
                mysql.connection.commit()
                session["mail"]=_email
                session["role"]="cliente"
                id = getIdMail(_email)
                session["id"]=id
                return redirect("/")
            else:
                msg = str(data[0])
                return render_template('signup.html', msg=msg)
        else:
            msg="Inserisci tutti i dati"
            return render_template('signup.html', msg=msg)

@app.route('/login', methods=['POST','GET'])
def login(): 
    #se ho richiesta get mando pagine
    if request.method == 'GET':
        return render_template('login.html')
    
    if request.method == 'POST':
        _email = request.form['inputEmail']
        _password = request.form['inputPassword']

        # validate the received values
        if _email and _password:
            
            #check if mail is in db
            isValid = checkValidClientMail(_email)
            if isValid:
                hashed_pwd = getClientHashedPwd(_email)
                if not check_password_hash(hashed_pwd,_password):
                    msg = "Password sbagliata"
                else:
                    id = getIdMail(_email)
                    session["id"]=id
                    session["mail"]=_email
                    session["role"]="cliente"
                    return redirect("/")


            else: 
                msg="Mail non registrata"

            return render_template('login.html', msg=msg)
            hashed_password = generate_password_hash(_password)
            
        else:
            msg="Inserisci tutti i dati"
        return render_template('signup.html', msg=msg)

@app.route('/catalogo')
def catalogo():
    ricambi = get_elenco_ricambi()
    accessori = get_elenco_accessori()
    return render_template('catalogo.html', ricambi=ricambi, accessori=accessori)

@app.route('/accessorio/')
def accessorio():
    if not isLogged():
        return render_template('index.html', login=False)
    id_acc = request.args.get("id")
    dettagli_accessorio = get_info_accessorio(id_acc)
    return render_template('accessorio.html', accessori= dettagli_accessorio)

@app.route('/ricambio/')
def ricambio():
    id_acc = request.args.get("id")
    dettagli_ricambio = get_info_ricambio(id_acc)
    return render_template('ricambio.html', ricambi= dettagli_ricambio)


@app.route('/interventi')
def interventi():
    if not isLogged():
        return render_template('index.html', login=False)
    id = getMail()

    interventi = get_elenco_interventi()
    return render_template('interventi.html', interventi=interventi)

@app.route('/intervento/')
def intervento():
    if not isLogged():
        return render_template('index.html', login=False)
    id_int= request.args.get("id")
    dettaglio_intervento = get_info_intervento(id_int)
    return render_template("intervento.html", interventi=dettaglio_intervento)

@app.route('/intervento/prenota/', methods=['POST','GET'])
def prenota_intervento():
    
    if request.method == "GET":
        if not isLogged():
            return render_template('index.html', login=False)
        id_int= request.args.get("id_int")
        id_off= request.args.get("id_off")
        mail = getMail()
        client_id = getIdCliente()
        auto = get_auto_proprietario(client_id)
        return render_template("prenotaIntervento.html", officina = id_off, intervento=id_int, auto=auto)
    else:
        if isLogged():
            id_off = request.form["id_officina"]
            id_intervento = request.form["id_intervento"]
            data = request.form['giorno']
            mail =  getMail()
            client_id = getIdCliente()
            id_auto = request.form['auto']
            prenotaIntervento(client_id,id_off,id_intervento,data,id_auto)
            return render_template('index.html',login=True, mail=getIdCliente(),role=getRole())

@app.route('/auto')
def auto():
    if not isLogged():
        return render_template('index.html', login=False)
    id_cliente = getIdCliente()
    listaAuto = get_auto_proprietario(id_cliente) 
    return render_template("automobili.html", automobili=listaAuto)


@app.route("/addAuto", methods=['POST'])
def addAuto():
    if isLogged():
        r = json.loads(request.data)
        anno = r['anno']
        targa = r['targa']
        telaio = r['nTelaio']
        id_cliente = getIdCliente()
        addCar(targa,anno,telaio, id_cliente)
    
        return "ok"

@app.route('/appuntamenti')
def appuntamenti():
    if not isLogged():
        return render_template('index.html', login=False)
    mail = getMail()
    client_id = getIdCliente()
    appuntamenti = getApointments(client_id)

    return render_template("appuntamenti.html", appuntamenti= appuntamenti)


#dipendenti

#login dipendenti
@app.route('/login/dipendenti', methods=['POST','GET'])
def login_dipendenti(): 

    #se ho richiesta get mando pagine
    if request.method == 'GET':
        return render_template('logindip.html')
    
    if request.method == 'POST':
        _code = request.form['inputCode']
        _password = request.form['inputPassword']

        # validate the received values
        if _code and _password:
            
            #check if mail is in db
            isValid = checkValidDipCode(_code)
            if isValid:
                hashed_pwd = getDipHashedPwd(_code)
                if not check_password_hash(hashed_pwd,_password):
                    msg = "Password sbagliata"
                else:
                    codiceOfficina = getOffDip(_code)

                    session["mail"]= _code
                    session["officina"]= codiceOfficina
                    session["role"]="dipendente"
                    return redirect("/")


            else: 
                msg="Codice non registrato"

            return render_template('logindip.html', msg=msg)
            hashed_password = generate_password_hash(_password)
            
        else:
            msg="Inserisci tutti i dati"
        return render_template('logindip.html', msg=msg)

@app.route("/amministrazione")
def amministrazione():
    #controllo il login
    if not isLogged():
        return render_template('index.html', login=False)
    #vedo officina di appartenenza
    codiceDip = getMail()
    codiceOfficine = getOffDip(codiceDip)
 
    #controllo se officina regionale
    centrale = officinaEcentrale(codiceOfficine)
    #ottengo dati da mostrare

    #se l'officine è centrale mostro l'elenco crud di tutti i ricambi
    if(True):
        ricambi = get_elenco_ricambi()
    #mostro la tabella per impostare la disponibilità e il prezzo dei ricambi
    ricambiOff = getRicambiOfficina(codiceOfficine)

    #ricambi ancora non inseriti nel catalogo dell'officina locale
    ricambiNonInOff = getRicambiNonInOfficina(codiceOfficine)
    #visualizzo gli interventi prenotati a partire da oggi
    interventi = get_elenco_interventiOff(codiceOfficine)

    return render_template('ammPanel.html', interventi=interventi, ricambi = ricambi, ricambiOff=ricambiOff,ricambiNonInOff=ricambiNonInOff)
    pass

@app.route("/addRicambio", methods=['POST'])
def addRicambio():
    if isLogged():     
        r = json.loads(request.data)
        nome = r['inputnome']
        descrizione = r['inputdescrizione']
        aggiungiPezzoRicambio(nome, descrizione)
        return "ok"


@app.route("/addRicambioOff", methods=['POST'])
def addRicambioOff():
    if isLogged():
        r = json.loads(request.data)
        quantità = str(float(r['quantitàRic']))
        nome = r['nomeRic']
        prezzo = r['costoRic']
        id_off = getOff()
        insertPezzoIntoOfficina(id_off,nome, prezzo, quantità)
        return "ok"

@app.route("/delRicambio", methods=['POST'])
def delRicambioOff():
    if isLogged():
        r = json.loads(request.data)
        id = r['id']
        deletePezzo(id)
        return "ok"

#funzione che aggiunge un autoveicolo a un cliente
def addCar(targa,anno,telaio,prop):
    cur = mysql.connection.cursor()
    cur.callproc('sp_add_car',[prop,anno,targa,telaio])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()

#funzione che dice se utente è loggato
def isLogged():
    mail = session.get("mail")
    if mail == None:
        return False
    return True

#funzione che restituisce il ruolo dell'utente da session (se loggato)
def getRole():
    role = session.get("role")
    return role

#funzione che restituisce la mail dell'utente da session (se loggato)
def getMail():
    mail = session.get("mail")
    return mail

#funzione che restituisce id cliente da session
def getIdCliente():
    id = mail = session.get("id")
    return id
#funzione che restituisce id cliente dal db
def getIdMail(mail):
    cur = mysql.connection.cursor()
    cur.callproc('sp_get_id_from_mail',[mail])
    data = cur.fetchall()
    cur.close()
    return data[0][0]


#FUNCTIONS
#funzione che cancella un pezzo di ricambio dal db di tutti i pezzi
def deletePezzo(id):    
    cur = mysql.connection.cursor()
    cur.callproc('sp_delete_pezzo',[id])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()
#funzione che dice se la mail è gia registrata e quindi non è valida
def checkValidClientMail(mail):
    cur = mysql.connection.cursor()
    checkMailFunction= 'select elaborato.client_mail_exist("%s");' % mail
    cur.execute(checkMailFunction)
    res= (cur.fetchall())[0][0]
    cur.close()
    isValid = bool(res)
    return isValid
#funzione che returna password del cliente dal db
def getClientHashedPwd(mail):
    cur = mysql.connection.cursor()
    getPasswordFunxction = 'select elaborato.get_client_password("%s");'% mail
    cur.execute(getPasswordFunxction)
    stored_pwd= (cur.fetchall())[0][0]
    return stored_pwd
#funzione che aggiunge pezzo di ricambio generale al db
def aggiungiPezzoRicambio(nome, descrizione):
    cur = mysql.connection.cursor()
    cur.callproc('sp_aggiungi_ricambio',[nome,descrizione])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()
#funzione che aggiunge servizio generale al db
def aggiungiServizio(nome, descrizione):
    cur = mysql.connection.cursor()
    cur.callproc('sp_aggiungi_servizio',[nome,descrizione])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()
#funzione che aggiunge accessorio generale al db
def aggiungiAccessorio(nome, descrizione):
    cur = mysql.connection.cursor()
    cur.callproc('sp_aggiungi_accessorio',[nome,descrizione])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()
#funzione che crea officina
def aggiungiOfficina(denominazione, indirizzo,centrale,regione):
    cur = mysql.connection.cursor()
    cur.callproc('sp_crea_officina',[denominazione,descrizione,centrale,regione])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()
#funzione che resituisce elenco ricambi globale
def get_elenco_ricambi():
    cur = mysql.connection.cursor()
    cur.callproc('get_elenco_ricambi',[])
    data = cur.fetchall()
    cur.close()
    return data
#funzione che resituisce elenco accessori globale
def get_elenco_accessori():
    cur = mysql.connection.cursor()
    cur.callproc('get_elenco_accessori',[])
    data = cur.fetchall()
    cur.close()
    return data
#funzione che resituisce prezzi e quantità singolo accessorio
def get_info_accessorio(id_acc):
    cur = mysql.connection.cursor()
    cur.callproc('get_dettaglio_accessorio',[id_acc])
    data = cur.fetchall()
    cur.close()
    return data

def get_info_ricambio(id_ric):
    cur = mysql.connection.cursor()
    cur.callproc('get_dettaglio_pezzo',[id_ric])
    data = cur.fetchall()
    cur.close()
    return data

def get_elenco_interventi():
    cur = mysql.connection.cursor()
    cur.callproc('get_elenco_interventi',[])
    data = cur.fetchall()
    cur.close()
    return data

def get_info_intervento(id_int):
    cur = mysql.connection.cursor()
    cur.callproc('get_dettaglio_intervento',[id_int])
    data = cur.fetchall()
    cur.close()
    return data

def get_auto_proprietario(id_prop):
    cur = mysql.connection.cursor()
    cur.callproc('get_cars_byOwner',[id_prop])
    data = cur.fetchall()
    cur.close()
    return data

#funzione che prenota intervento per cliente
def prenotaIntervento(id_cliente,id_off, id_int, giorno, auto):
    cur = mysql.connection.cursor()
    cur.callproc('sp_crea_prenotazione',[id_cliente,id_off,id_int,giorno,auto])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()
                

def getApointments(id_cliente):
    cur = mysql.connection.cursor()
    cur.callproc('get_appuntamenti_utente',[id_cliente])
    data = cur.fetchall()
    cur.close()
    return data

def getRicambiOfficina(id_officina):
    cur = mysql.connection.cursor()
    cur.callproc('get_pezzi_officina',[id_officina])
    data = cur.fetchall()
    cur.close()
    return data

def getRicambiNonInOfficina(id_officina):
    cur = mysql.connection.cursor()
    cur.callproc('get_pezzi_non_officina',[id_officina])
    data = cur.fetchall()
    cur.close()
    return data

#controllo se codie dip è valido
def checkValidDipCode(code):
    cur = mysql.connection.cursor()
    checkMailFunction= 'select elaborato.dip_code_exist("%s");' % code
    cur.execute(checkMailFunction)
    res= (cur.fetchall())[0][0]
    cur.close()
    isValid = bool(res)
    return isValid
#return pwd dipendente da db hashata
def getDipHashedPwd(code):
    cur = mysql.connection.cursor()
    getPasswordFunxction = 'select elaborato.get_dip_password("%s");'% code
    cur.execute(getPasswordFunxction)
    stored_pwd= (cur.fetchall())[0][0]
    return stored_pwd

#ottengo il codice officina del dipendente
def getOffDip(code):
    return 1 #todo
    cur = mysql.connection.cursor()
    getOffDip = 'select elaborato.get_dip_officina("%s");'% code
    cur.execute(getOffDip)
    codiceOff = (cur.fetchall())[0][0]
    print(codiceOff)
    return codiceOff
#restituisce l'id dell'officina a cui appartiene il dipendente da sessio
def getOff():
    mail = session.get("officina")
    return mail

#return true se l'officina è centrale
def officinaEcentrale(codice):
    cur = mysql.connection.cursor()
    checkOffFunction= 'select elaborato.officina_centrale("%s");' % codice
    cur.execute(checkOffFunction)
    res= (cur.fetchall())[0][0]
    cur.close()
    centr = bool(res)
    return centr

#ottiene elenco interventi officina dal giorno corrente
def get_elenco_interventiOff(id_off):
    cur = mysql.connection.cursor()
    cur.callproc('get_appuntamenti_officina',[id_off])
    data = cur.fetchall()
    cur.close()
    return data
#funzione che rende disponibile all'interno di una singola officina un ricambio 
def insertPezzoIntoOfficina(id_off,id_pezzo,qt,prezzo):
    cur = mysql.connection.cursor()
    cur.callproc('insert_ricambio_officina',[id_off,id_pezzo,qt,prezzo])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()
