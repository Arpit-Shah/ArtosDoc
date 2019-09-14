@DataProvider
*************

DataProvider is used when same code(logic) is repeatedly executed with fix set of data. Data could be primitive or it can be complex object.

Annotation @DataProvider is used to denote a Java method as a DataProvider. Method annotated with @DataProvider can be within a test case class or can be in separate class as long as it is within Runner's scan scope. Warning will be printed if two data provider have duplicate name/descriptions or data provider is missing. 

.. csv-table:: 
	:header: Attribute, Description, Mandatory/Optional, Default Value
	:widths: 15, 40, 25, 20
	:stub-columns: 0
	
	name(), name/description, Mandatory, NA

..

* name() 
	* name/description is used to bind data provider to a test unit. 
	* name/description is case insensitive.

Annotation use case(s)
######################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 0

	@DataProvider(name = "UsernameAndPassword")

..

DataProvider Samples
####################

Data provider could be simple or complex 2D object.

.. code-block:: Java
	:linenos:
	:emphasize-lines: 3, 17, 30

	public class Collection_Of_DataProvider {

		@DataProvider(name = "UsernameAndPassword")
		public Object[][] dataproviderMethod_1(TestContext context) {

			Object[][] data = new Object[][] {
					// {User-name, Password}
					{"Joe", "1234"},
					{"Sam", "2345"},
					{"Mark", "1453"},
					{"Maya", "1458"},
				
			};
			return data;
		}

		@DataProvider(name = "UsernameAndStudentDetails")
		public Object[][] dataproviderMethod_1(TestContext context) {

			Object[][] data = new Object[][] {
					// {Name, id, phone, marks, grade}
					{ "Joe", new String[] { "1", "0210123456", "20", "F" } }, 
					{ "Sam", new String[] { "2", "0210123457", "40", "D" } },
					{ "Mark", new String[] { "3", "0210123458", "70", "C" } }, 
					{ "Maya", new String[] { "4", "0210123459", "90", "A" } },
			};
			return data;
		}

		@DataProvider(name = "UsernameAndStudentDetailsPerClass")
		public Object[][] dataproviderMethod_2(TestContext context) {

			Classroom classroom = (Classroom) context.getGlobalObject("CLASSROOM_ENUM");
			switch (classroom) {
			case CLASS_A:
				return new Object[][] {
					// {Name, id, phone, marks, grade}
					{"Joe", new String[] { "1", "0210123456", "20", "F" }},
					{"Sam", new String[] { "2", "0210123457", "40", "D" }},
				};
			case CLASS_B:
				return new Object[][] {
					// {Name, id, phone, marks, grade}
					{"Mark", new String[] { "3", "0210123458", "70", "C" }},
					{"Maya", new String[] { "4", "0210123459", "90", "A" }},
				};
			default:
				return null;
			}

		}

	}

	class CLASSROOM {
		public enum Classroom {
			CLASS_A,
			CLASS_B
		}
	}


..

Bind DataProvider to unit
#########################

.. code-block:: Java
	:linenos:
	:emphasize-lines: 4, 14, 32

	@TestCase(sequence = 1)
	public class Test_Student_Grade implements TestExecutable {

		@Unit(sequence = 1, dataprovider = "UsernameAndPassword")
		public void testUnit_1(TestContext context) throws Exception {
			// -----------------------------------------------------------------
			String username = (String) context.getParameterisedObject1();
			String password = (String) context.getParameterisedObject2();

			context.getLogger().debug(username + " : " + password);
			// -----------------------------------------------------------------
		}

		@Unit(sequence = 2, dataprovider = "UsernameAndStudentDetails")
		public void testUnit_2(TestContext context) throws Exception {
			// -----------------------------------------------------------------
			String username = (String) context.getParameterisedObject1();
			String[] userDetails = (String[]) context.getParameterisedObject2();

			context.getLogger().debug(username + " : " + userDetails[0] + " , " + userDetails[1]);
			// -----------------------------------------------------------------
		}
		
		@Unit(sequence = 3)
		public void testUnit_3(TestContext context) throws Exception {
			// -----------------------------------------------------------------
			// Set global variable so it can be used in unit 4
			context.setGlobalObject("CLASSROOM_ENUM", Classroom.CLASS_A);
			// -----------------------------------------------------------------
		}
		
		@Unit(sequence = 4, dataprovider = "UsernameAndStudentDetailsPerClass")
		public void testUnit_4(TestContext context) throws Exception {
			// -----------------------------------------------------------------
			String username = (String) context.getParameterisedObject1();
			String[] userDetails = (String[]) context.getParameterisedObject2();

			context.getLogger().debug(username + " : " + userDetails[0] + " , " + userDetails[1]);
			// -----------------------------------------------------------------
		}
	}

..
