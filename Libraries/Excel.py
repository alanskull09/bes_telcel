# Copyright 2020-     NEORIS | Jesus Barajas
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
import pandas as pd
import os
from robot.libraries.BuiltIn import BuiltIn


class Excel:
	"""This library was developed for easy data management using Excel documents, giving the user a easier solution to edit execution data on test projects.

	Copyright 2020-     NEORIS | Jesus Barajas

	= Table of contents =

    - `Requirements`
	- `Excel sheet Data Format`
    - `First steps`
    - `Usage`
    - `Examples`
    

	= Requirements =
		As described in the requirements section, you have to install the latest versions of the described elements in this section, the following sections describe how to write Excel formated files to use the library and explain the process of import of this single keyword library. 
		- Robotframework installation.
		- Python 2.7.15 or above.
		- Pandas Library for Pyton. 

	= First steps =

	= Excel sheet Data Format = 
	Data files has to be written in a specific format, firstly the two first cells on the top are taken as placeholders Note:"Use this syntax in order to make the library work" 
		
	| Variable | DATA |
	| URL | www.robotframework.com |
	| user | sampleuser123 |
	| pass | secret123 |
	
	This is an example of a correct syntax of a document to load the variables with the given name.


	

	
	= Usage =
	This library is a single keyword one, so the import process is limited to import the *Excel.py* File into your project, then you will have access to the keyword *Leer datos*


	= Example =

	This is an example where we want to build our global variables in the enviroment.
	First we need to write our Excel document with the format described in the *Excel sheet Format secction.*

	| Variable | DATA |
	| Global | This is a global variable |
	| Global2 | This is a global variable too |
	| Global3 | This one is a global variables |

	Remember to save this file with the according name as described in *Excel sheet Format secction.*
		- T=Test Level Variables, *Example*: T-Variables1.xlxs
		- G=Global Level Variables *Example*: G-Variables2.xlxs
		- S=Suite Level Variables *Example*: S-Variables3.xlxs
	


	
	"""
	ROBOT_LIBRARY_SCOPE = 'TEST SUITE'

	__version__ = '1.0'




	
	def LeerDatos(self,doc):
		""" This keyword Takes one argument(Source Document) And loads data to robotframework.
			
		
		
		*Example*
		| LeerDatos | DataFileInxlsformat |
		

		This example shows how to load the variables from the document into a specific context(TestSuite)

		"""
		
		excel_data_df = pd.read_excel(doc+".xlsx", sheet_name='Sheet1')
		global Lista1
		global Lista2
		Lista1=excel_data_df['VARIABLE'].tolist()
		Lista2=excel_data_df['DATA'].tolist()					
		print(Lista1,Lista2)
		for i in range(0,len(Lista1)):
			BuiltIn().set_test_variable("${"+str(Lista1[i])+"}",Lista2[i])
	
		

		del Lista1[:]
		del Lista2[:]
