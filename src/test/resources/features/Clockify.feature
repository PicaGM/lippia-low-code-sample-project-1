@Clockify @Regression
Feature: Comprobar el funcionamiento de API Clockify

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2

  @GetWorkspace @Smoke
  Scenario: Obtener los Workspace
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspaces
    When execute method GET
    Then the status code should be 200
    * define workspaceId = $.[0].id

<<<<<<< Updated upstream
  @AddWorkspace @Smoke
=======
  @AddWorkspace
>>>>>>> Stashed changes
    Scenario: Añadir un nuevo Workspace
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspaces
    And body jsons/bodies/workspace.json
    When execute method POST
    Then the status code should be 201

<<<<<<< Updated upstream
  @NewProject @Smoke
=======
  @NewProject
>>>>>>> Stashed changes
  Scenario: Crear un nuevo proyecto en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And body jsons/bodies/project.json
    When execute method POST
    Then the status code should be 201

  @GetProjects @Smoke
  Scenario: Buscar los todos proyectos en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
    * define projectId = $.[0].id

  @FindProject @Smoke
  Scenario: Encontrar un proyecto por ID en el Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method GET
    Then the status code should be 200

  @ModifyProject @Smoke
  Scenario: Modificar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And body jsons/bodies/modify.json
    When execute method PUT
    Then the status code should be 200

<<<<<<< Updated upstream
  @DeleteProject @Smoke
=======
  @DeleteProject
>>>>>>> Stashed changes
  Scenario: Eliminar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method DELETE
    And print response
    Then the status code should be 200

<<<<<<< Updated upstream
  @AddClient @Smoke
=======
  @AddClient
>>>>>>> Stashed changes
  Scenario: Añadir un cliente al Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And body jsons/bodies/clients.json
    When execute method POST
    Then the status code should be 201

<<<<<<< Updated upstream
  @FindClients @Smoke
=======
  @FindClients
>>>>>>> Stashed changes
  Scenario: Encontrar los clientes del Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    When execute method GET
    Then the status code should be 200

<<<<<<< Updated upstream
  @AddTask @Smoke
=======
  @AddTask
>>>>>>> Stashed changes
  Scenario: Añadir una tarea a un Proyecto
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And body jsons/bodies/task.json
    When execute method POST
    Then the status code should be 201

<<<<<<< Updated upstream
  @GetTasks @Smoke
=======
  @GetTasks
>>>>>>> Stashed changes
    Scenario: Encontrar las tareas de un Proyecto
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    When execute method GET
    Then the status code should be 200
    * define taskId = $.[0].id

<<<<<<< Updated upstream
  @UpdateTask @Smoke
=======
  @UpdateTask
>>>>>>> Stashed changes
  Scenario: Modificar una tarea de un Proyecto
    Given call Clockify.feature@GetTasks
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    And body jsons/bodies/taskupdate.json
    When execute method PUT
    Then the status code should be 200

<<<<<<< Updated upstream
  @DeleteTask @Smoke
=======
  @DeleteTask
>>>>>>> Stashed changes
  Scenario: Eliminar una tardea de un Proyecto
    Given call Clockify.feature@GetTasks
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    When execute method DELETE
    Then the status code should be 200