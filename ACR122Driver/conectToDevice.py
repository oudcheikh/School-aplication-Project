

# import all libs neededs (to improve)
from smartcard.System import readers

#find reader connected (to improve: case more than One reader are finds)
def getreader():

    reader = readers()
    if len(reader) == 0:
        print 'there is no reder'
        return (False, False)
    else:
        #To do: il faut qu'on cherche par le nom du lecteur
        print "Available readers: ", reader[0]
        return (reader[0], True)

