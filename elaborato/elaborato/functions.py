
#FUNCTIONS

def deletePezzo(id):    
    cur = mysql.connection.cursor()
    cur.callproc('sp_delete_pezzo',[id])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()

  
def checkValidClientMail(mail):
    cur = mysql.connection.cursor()
    checkMailFunction= 'select elaborato.client_mail_exist("%s");' % mail
    cur.execute(checkMailFunction)
    res= (cur.fetchall())[0][0]
    cur.close()
    isValid = bool(res)
    return isValid

def getClientHashedPwd(mail):
    cur = mysql.connection.cursor()
    getPasswordFunxction = 'select elaborato.get_client_password("%s");'% mail
    cur.execute(getPasswordFunxction)
    stored_pwd= (cur.fetchall())[0][0]
    return stored_pwd

def aggiungiPezzoRicambio(nome, descrizione):
    cur = mysql.connection.cursor()
    cur.callproc('sp_aggiungi_ricambio',[nome,descrizione])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()

def aggiungiServizio(nome, descrizione):
    cur = mysql.connection.cursor()
    cur.callproc('sp_aggiungi_servizio',[nome,descrizione])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()

def aggiungiAccessorio(nome, descrizione):
    cur = mysql.connection.cursor()
    cur.callproc('sp_aggiungi_accessorio',[nome,descrizione])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()

def aggiungiOfficina(denominazione, indirizzo,centrale,regione):
    cur = mysql.connection.cursor()
    cur.callproc('sp_crea_officina',[denominazione,descrizione,centrale,regione])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()

def getIdClienteDaMail(mail):
    cur = mysql.connection.cursor()
    getIdFunction= 'select elaborato.get_id_from_mail("%s");' % mail
    cur.execute(getIdFunction)
    res= (cur.fetchall())[0][0]
    cur.close()
    return res
    
def get_elenco_ricambi():
    cur = mysql.connection.cursor()
    cur.callproc('get_elenco_ricambi',[])
    data = cur.fetchall()
    cur.close()
    return data

def get_elenco_accessori():
    cur = mysql.connection.cursor()
    cur.callproc('get_elenco_accessori',[])
    data = cur.fetchall()
    cur.close()
    return data

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

#dip 
def checkValidDipCode(code):
    cur = mysql.connection.cursor()
    checkMailFunction= 'select elaborato.dip_code_exist("%s");' % code
    cur.execute(checkMailFunction)
    res= (cur.fetchall())[0][0]
    cur.close()
    isValid = bool(res)
    return isValid
   
def getDipHashedPwd(code):
    cur = mysql.connection.cursor()
    getPasswordFunxction = 'select elaborato.get_dip_password("%s");'% code
    cur.execute(getPasswordFunxction)
    stored_pwd= (cur.fetchall())[0][0]
    return stored_pwd

#ottengo il codice officina del dipendente
def getOffDip(code):
    return 1
    cur = mysql.connection.cursor()
    getOffDip = 'select elaborato.get_dip_officina("%s");'% code
    cur.execute(getOffDip)
    codiceOff = (cur.fetchall())[0][0]
    print(codiceOff)
    return codiceOff

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

def insertPezzoIntoOfficina(id_off,id_pezzo,qt,prezzo):
    cur = mysql.connection.cursor()
    cur.callproc('insert_ricambio_officina',[id_off,id_pezzo,qt,prezzo])
    data = cur.fetchall()
    mysql.connection.commit()
    cur.close()
