


from smartcard.CardType import AnyCardType
from smartcard.CardRequest import CardRequest
from conectToDevice import getreader

getuid = [0xFF, 0xCA, 0x00, 0x00, 0x00]
reader = getreader()
connection = reader.createConnection()
cardtype = AnyCardType()

i = 0
while i < 6:
    i += 1
    cardrequest = CardRequest(timeout=1, cardType=cardtype)

    try:
        cardservice = cardrequest.waitforcard()
        connection.connect()
        data, sw1, sw2 = connection.transmit(getuid)
        print (data, sw1, sw2)

    except Exception as e:

        if str(e) == 'Time-out during card request':
            print (e)
