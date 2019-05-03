# Sparta-sinatra-guitars

<%=  %> - Will execute ruby code and inject <%= code in here %> into whatever element
<%  %> - Will execute ruby code and <%= code in here  %> will be thrown away

$variable - globally defined variable
@variable - is an instance variable, does not exist outside of that block of code


----------- To understand more ---------

Where is this called in file path name?
set :root, File.join(File.dirname(__FILE__), '..')

When should I use an instance variable as opposed to just a variable?
Guitars_controller.erb line 78-86
