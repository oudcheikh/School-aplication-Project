

from smartcard.CardType import AnyCardType
from smartcard.CardRequest import CardRequest
from conectToDevice import getreader

getuid = [0xFF, 0xCA, 0x00, 0x00, 0x00]

#trouver le lecteur
reader = getreader()[0]

if  reader == False:
    'Le lecteur n est pas trouver'
    break
else:
    #Connecter au lecteur
    connection = reader.createConnection()
    
    #inctancie  la classe pour vhervher pour n'import quel type de carte
    cardtype = AnyCardType()
    #attendre qu'une carte aparaisse
    cardrequest = CardRequest(timeout=10*60, cardType=cardtype)
    try:
        #on attend pour 10*60 seconde
        cardservice = cardrequest.waitforcard()

        #on se connecte avecla carte apparu via le lecteur
        connection.connect()
        #on envoie la commande qui lu ID de la carte 
        data, sw1, sw2 = connection.transmit(getuid)

        print (data, sw1, sw2)

    except Exception as e:
        if str(e) == 'Time-out during card request':
            print (e)

