#!/usr/bin/env python3.5.2
# -*- coding: utf-8 -*-
#Auther: mouldcheikh

import json
import bcrypt



class LOADCONFIG:

    """
    Cette classe permet de recuperer les informations de la base de donnes.

    """

    def __init__(self):

        """
        Le constricteur recupert le donné dufichier de config
        au momment de l'instanciationde la Class
        """
        self.data = {}
        # il faut ajouter le lien de fichier dansl projet
        filecongige = '/home/ould/rimppprmp/ACC/CONFIG.json'
        with open(filecongige) as data_file:
            self.data = json.load(data_file)
        print (self.data)


    def getDBname(self):

        """
        Rnvoi le nomde la classe
        """
        return self.data['dataBase']['database']

    def getDBserver(self):
        """
        Renvoi le serveur
        :return:localhost
        """
        return self.data['dataBase']['server']


    def getDBport(self):

        """
        Renvoi le numero du port
        :return:3306
        """
        return self.data['dataBase']['port']


    def getDBuser(self):

        """
        Renvoie le nom de l'utilisateur
        :return:root
        """
        return self.data['dataBase']['user']


    def getDbPW(self):

        """
        Renvoi le mot de passe de l'utilisateur
        :return:
        """
        return self.data['dataBase']['password']

    def creatSaltPW(self):

        salt = bcrypt.gensalt()
        #To do: populate CONFIG.json by salt in pw place
        return salt

    def hashPW(self, pw, salt):
        # Hash a password for the first time, with a randomly-generated salt
        print (pw)
        password = str.encode(pw)
        hashedPW = bcrypt.hashpw(password, salt)
        return hashedPW

    def checkPW(self, pw, hashedPW):

        password = str.encode(pw)
        # Check that an unhashed password matches one that has previously been
        # hashed
        if bcrypt.checkpw(password, hashedPW):
            print("It Matches!")
        else:
            print("It Does not Match :(")

if __name__ == '__main__':

    infoDATABASE = LOADCONFIG()
    print (infoDATABASE.getDbPW())

    salt = infoDATABASE.creatSaltPW()
    print (salt)
    hashedPW = infoDATABASE.hashPW('moi', salt)
    print(hashedPW)
    infoDATABASE.checkPW('moi', hashedPW)
