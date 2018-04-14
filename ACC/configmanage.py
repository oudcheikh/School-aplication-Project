#!/usr/bin/env python3
# -*- coding: utf-8 -*-
#Auther: mouldcheikh

import json

class LOADCONFIG:

    """
    Cette classe permet de rcuperer les informations de la base d donnes.

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


    def getDBpassword(self):

        """
        Renvoi le mot de passe de l'utilisateur
        :return:
        """
        return self.data['dataBase']['password']

if __name__ == '__main__':

    infoDATABASE = LOADCONFIG()
    print (infoDATABASE.getDBpassword())

