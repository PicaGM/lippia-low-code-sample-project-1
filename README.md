# Lippia API Lowcode v1.0 @_Unreleased_

[![Crowdar Official Page](https://img.shields.io/badge/crowdar-official%20page-brightgreen)](https://crowdar.com.ar/)
[![Lippia Official Page](https://img.shields.io/badge/lippia-official%20page-brightgreen)](https://www.lippia.io/)
<!-- [![Maven Central](https://img.shields.io/badge/maven%20central-3.2.3.8-blue)](https://search.maven.org/artifact/io.lippia/core/3.2.3.8/jar) -->

#### **Lippia AC** is a core level extension that allows us to automate api tests without the need to write code

## Requirements

+ **JDK** [Download](https://www.oracle.com/java/technologies/downloads/#java8-windows)
+ **Maven** [Download](https://dlcdn.apache.org/maven/maven-3/3.8.6/binaries/apache-maven-3.8.6-bin.zip)
+ **Git
  Client** [Download](https://github.com/git-for-windows/git/releases/download/v2.38.1.windows.1/Git-2.38.1-64-bit.exe)

## Getting Started

```bash
$ git clone https://github.com/Crowdar/lippia-low-code-sample-project.git && cd "$(basename "$_" .git)"

```

#### Once the project is cloned and opened with your preferred ide, we can run the tests with the following command

```bash
$  mvn clean test -Dcucumber.tags=@Sample -Denvironment=default
```

## Contents

1. [Variables](##Variables)    
   I. [Define](#title_define)
2. [Properties](../path/to/properties)   
   I. [Lippia configuration file](#title_lippia_conf_file)   
   II. [Basic properties file](../path/to/properties)
3. [Requests](../path/to/requests)   
   I. [Base URL](#title_base_url)   
   II. [Endpoint](#title_endpoint)   
   III. [Headers](#title_headers)   
   IV. [Body](#title_body)   
   V. [HTTP Method](#title_http_method)
4. [Assertions](#title_assertions)   
   I. [Status code](#title_status_code)
   II. [JSON](##II.JSON)
   III.[Schema](#title_schema)
5. [Steps Glossary](#title_step_glosary)

## Variables

### I. <a id="title_define"></a>Define

#### In order to define a variable and assign it with a constant value or a variable value use :

      * define [^\d]\S+ = \S+
      * define codigo = 7000

#### So that you need to call the previously defined variable, use double brackets :

### For example

       Given body body_request_1700.json
       * define codigo = 7000
       When execute method POST
       Then the status code should be 400
       And response should be $.code = {{codigo}}

--------------------------------------------------------------

#### alternatively you could use the value obtained from a response :

      Given body body_request_1700.json
      When execute method POST
      Then the status code should be 200
      And response should be $.code = 7114
      * define codigo = $.code

--------------------------------------------------------------

## <a id="title_lippia_conf_file"></a>Lippia Configuration file

### (lippia.config)

```
├── automation-reestructuracion-gateway
│   │   
│   ├── src
│   │   ├── main
│   ├── java
│   │     └── ...
│   ├── resources 
│   │     └── ...
│   ├── test
│   │     ├── resources
│   │     │   └── features
│   │     │   └── files
│   │     │   └── jsons
│   │     │   |    └──bodies
│   │     │   |    └── ...
│   │     │   └── queries
│   │     │   └── ...
│   │     │   └── extent.properties
│   │     │   └── lippia.conf
```

#### In this file you can specify the base url of the different environments, such as development, integration or testing :

```
environments {
    default {
        "base.url" = "https://www.by.default.com"
    }

    dev {
        "base.url" = "https://www.dev-by.default.com"
    }

    test {
        "base.url" = "https://www.test-by.default.com"
    }

    prod {
        "base.url" = "https://www.?by.default.com"
    }
}
```

#### The environments can  be changed from the command line by referencing the respective environment by its name.

### For example

     -Denvironment=test

## <a id="title_environment_manager"></a>Enviroment Manager

#### To obtain data from the Environment manager we use the following method, in this case it is not allowed to obtain the base url

      EnvironmentManager.getProperty("base.url")

--------------------------------------------------------------

## I.<a id="title_base_url"></a>Base URL

#### The base url can be defined by the following step, it is simply to replace the regular expression /\+S by the url :

### For example

      base url \S+
      Given base url https://rickandmortyapi.com/api/

#### Alternatively we can use the following notation, if we have defined the url in the lippia.conf file

| Version 3.3.0.0                          | Version 3.3.0.1 or newer                     |
|:-----------------------------------------|:---------------------------------------------|
| Given base url env.base_url_rickAndMorty | Given base url $(env.base_url_rickAndMorty)  |

--------------------------------------------------------------

## II.<a id="title_endpoint"></a>Endpoint

#### You can easily replace the endpoint value in the regular expression of the "\S+" step :

       endpoint \S+

### For example

      Given base url https://url-shortener-service.p.rapidapi.com
      And endpoint shorten

---------------------------------------------------------------------------------

## III.<a id="title_headers"></a>Headers

#### You can set a header just by defining the step and filling the key and the value as many times as you need to do it :

      And header \S+ = \S+

### For example

      And header Content-Type = application/json
      And header key = value

---------------------------------------------------------------------------------

## IV.<a id="title_body"></a>Body

```
├── automation-reestructuracion-gateway
│   │   
│   ├── src
│   │   ├── main
│   ├── java
│   │     └── ...
│   ├── resources 
│   │     └── ...
│   ├── test
│   │     ├── resources
│   │     │   └── features
│   │     │   └── files
│   │     │   └── jsons
│   │               └──bodies
│   │               └── ...
│        
```

#### You can reference a json file created in the default location (jsons/bodies folder) : 
####If the body doesn't need modification of any attribute or value, then this step is all that's required.

      Given body \S+

### For example

| Version 3.3.0.0                        | Version 3.3.0.1 or newer                           |
|:---------------------------------------|:---------------------------------------------------|
| Given body name_file.json              | Given body jsons/bodies/name_file.json             |

#### Or you can create a new folder inside it :

| Version 3.3.0.0                        | Version 3.3.0.1 or newer                           |
|:---------------------------------------|:---------------------------------------------------|
| Given body new_folder/name_file.json   | Given body jsons/bodies/new_folder/name_file.json  |



---------------------------------------------------------------------------------
### I. SET


#### If you need to modify the value of any attribute in the body, you can use the Step "set value <any> of key <any> in body <any>".
#### We don't need the Step "body \S+" in our scenario because this step accesses the entire JSON file and also makes the necessary modifications.
#### In this case, it requires three parameters: the value to be assigned, the name of the attribute that will take the value of the first parameter, and the path with the name of the JSON file.

### For example

         And set value 15 of key tags[1].id in body jsons/bodies/body2.json

---------------------------------------------------------------------------------

### II. DELETE

####Now, if you need to remove an attribute from the body, you can use Step "delete keyValue <any> in body <any>", This one requires only two parameters: the attribute name and the name of the JSON file containing the request.

### For example

           
           And delete keyValue tags[0].id in body jsons/bodies/body2.json
           
      
---------------------------------------------------------------------------------

- ## <a id="title_http_method"></a>HTTP Method

#### The HTTP Methods supported by steps are : GET | POST | PUT | PATCH | DELETE

### For example

     When execute method POST

---------------------------------------------------------------------------------

- # <a id="title_assertions"></a>Assertions

## I. <a id="title_status_code"></a>Status Code

#### The step to assert the HTTP response code is as follows :

         the status code should be <number>

### For example

         Then the status code should be 200

#### If the HTTP response code is anything other than what is expected, this assertion will result in the test failing.

## II. <a id="mi-seccion"></a>JSON

#### You can make assertions on any attribute of the obtained response, whether it's integer, float, double, string, or boolean value by referencing it by its name :

### For example

      And response should be name = Rick Sanchez

#### Another way to reference it is by prepending "$." before the attribute name :

       And response should be $.status = Alive


#### The following step, allows for validations based on equality or containing a value that matches the response obtained based on the provided parameter.

      And verify the response [^\s].+ 'equals' [^\s].*
      And verify the response [^\s].+ 'contains' [^\s].*

### For example
      And verify the response name 'contains' dog

### <a id="title_schema"></a>Schemas

```
├── automation-reestructuracion-gateway
│   │   
│   ├── src
│   │   ├── main
│   ├── java
│   │     └── ...
│   ├── resources 
│   │     └── ...
│   ├── test
│   │     ├── resources
│   │     │   └── features
│   │     │   └── files
│   │     │   └── jsons
│   │               └── ...
│   │               └── ...
│   │               └── ...
│   │               └── ...
│   │               └── schemas
|
│        
```

#### You can create a schema file with ".json" extension at the directory mentioned above (jsons/schemas folder).

### For example

| Version 3.3.0.0                         | Version 3.3.0.1 or newer                          |
|:----------------------------------------|:--------------------------------------------------|
| And validate schema character.json      | And validate schema jsons/schemas/character.json  |

## <a id="title_step_glosary"></a>Steps Glossary

| ENGLISH                                                              | SPANISH                                                                 |
|:---------------------------------------------------------------------|:------------------------------------------------------------------------|
| add query parameter '\<any>' = \<any>                                | agregar parametro a la query '\<any>' = \<any>                          |
| base url \S+                                                         | base url \S+                                                            |
| body \S+                                                             | body \S+                                                                |
| call \S+.feature[@:\$]\S+                                            | invocar \S+.feature[@:\$]\S+                                            |
| create connection database '\<any>'                                  | crear conexion a la base de datos '\<any>'                              |
| define [^\d]\S+ = \S+                                                | definir  [^\d]\S+ = \S+                                                 |
| delete keyValue \<any> in body \<any>                                | eliminar clave \<any> en el  body \<any>                                |
| endpoint \S+                                                         | endpoint \S+                                                            |
| execute method GET l POST l PUT l PATCH l DELETE                     | ejecutar metodo GET l POST l PUT l PATCH l DELETE                       |
| execute query '\<any>'                                               | ejecutar query '\<any>'                                                 |
| header \S+ = \S+                                                     | header \S+ = \S+                                                        |
| And I save from result JSON the attribute <any> on variable <any>    | guardo del resultado JSON el atributo <any> en la variable \<any>       |
| param \S+ = \S+                                                      | param \S+ = \S+                                                         |
| response should be [^\s].+ = [^\s].*                                 | la respuesta debe ser [^\s].+ = [^\s].*                                 |
| response should be [^\s].+ contains [^\s].*                          | la respuesta debe ser [^\s].+ contiene [^\s].*                          |
| set value \<any> of key \<any> in body \<any>                        | setear el valor \<any> de la clave \<any> en el body \<any>             |
| the status code should be \<number>                                  | el status code debe ser \<number>                                       |
| validate field '\<any>' = \<any>                                     | validar el campo '\<any>' = \<any>                                      |
| validate schema \<string>                                            | validar schema \<string>                                                |
| verify the response ([^\\s].+) '(equals &#124; contains)' ([^\\s].*) | verificar la respuesta ([^\\s].+) '(equals &#124; contains)' ([^\\s].*) |


