@ClockifyErrores @Regression
Feature: Caminos de error de TP4 Clockify

  @GetWorkspaceError400 @Smoke #Reemplazar GET por POST
  Scenario: Obtener los Workspace
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspaces
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method POST
    Then the status code should be 400

  @GetWorkspaceError401 @Smoke #Api key erronea
  Scenario: Obtener los Workspace
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspaces
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE
    When execute method GET
    Then the status code should be 401

  @GetWorkspaceError404 @Smoke #Endpoint erroneo
  Scenario: Obtener los Workspace
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspace
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @NewProjectError400 @Smoke #Nombre de proyecto ya existe
  Scenario: Crear un nuevo proyecto en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/project.json
    When execute method POST
    Then the status code should be 400

  @NewProjectError401 @Smoke #Error en el nombre de la Api key
  Scenario: Crear un nuevo proyecto en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And header Content-Type = application/json
    And header Accept = */*
    And header xapikey = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/project.json
    When execute method POST
    Then the status code should be 401

  @NewProjectError404 @Smoke #Endpoint erroneo
  Scenario: Crear un nuevo proyecto en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/project
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/project.json
    When execute method POST
    Then the status code should be 404

  @GetProjectsError400 @Smoke #Reemplazar GET por POST
  Scenario: Buscar los todos proyectos en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method POST
    Then the status code should be 400

  @GetProjectsError401 @Smoke #Api key erronea
  Scenario: Buscar los todos proyectos en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZT
    When execute method GET
    Then the status code should be 401

  @GetProjectsError404 @Smoke #Endpoint erroneo
  Scenario: Buscar los todos proyectos en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/project
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @FindProjectError400 @Smoke #ProjectId incorrecto
  Scenario: Encontrar un proyecto por ID en el Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/Hola,soyElProjectId
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 400

  @FindProjectError401 @Smoke #Sin Api key
  Scenario: Encontrar un proyecto por ID en el Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method GET
    Then the status code should be 401

  @FindProjectError404 @Smoke #Endpoint erroneo
  Scenario: Encontrar un proyecto por ID en el Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/project/{{projectId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @ModifyProjectError400 @Smoke #Endpoint erroneo
  Scenario: Modificar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/SoyUnID
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/modify.json
    When execute method PUT
    Then the status code should be 400

  @ModifyProjectError401 @Smoke #Sin Api key
  Scenario: Modificar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And header Content-Type = application/json
    And header Accept = */*
    And body jsons/bodies/modify.json
    When execute method PUT
    Then the status code should be 401

  @ModifyProjectError404 @Smoke #Endpoint erroneo
  Scenario: Modificar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/project/{{projectId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/modify.json
    When execute method PUT
    Then the status code should be 404

  @DeleteProjectError403 @Smoke
  Scenario: Eliminar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/NoID/projects/{{projectId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method DELETE
    Then the status code should be 403

  @DeleteProjectError401 @Smoke
  Scenario: Eliminar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = o
    When execute method DELETE
    Then the status code should be 401

  @DeleteProjectError404 @Smoke
  Scenario: Eliminar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projec/{{projectId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method DELETE
    Then the status code should be 404

  @AddClientError403 @Smoke
  Scenario: Añadir un cliente al Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/NoID/clients
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/clients.json
    When execute method GET
    Then the status code should be 403

  @AddClientError401 @Smoke
  Scenario: Añadir un cliente al Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMz
    And body jsons/bodies/clients.json
    When execute method POST
    Then the status code should be 401

  @AddClientError404 @Smoke
  Scenario: Añadir un cliente al Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/client
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/clients.json
    When execute method POST
    Then the status code should be 404

  @FindClientsError400 @Smoke
  Scenario: Encontrar los clientes del Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/NoID/clients
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method PATCH
    Then the status code should be 405

  @FindClientsError401 @Smoke
  Scenario: Encontrar los clientes del Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/clients
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 401

  @FindClientsError404 @Smoke
  Scenario: Encontrar los clientes del Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/client
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @AddTaskError405 @Smoke
  Scenario: Añadir una tarea a un Proyecto
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/NoID/tasks
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/task.json
    When execute method PUT
    Then the status code should be 405

  @AddTaskError401 @Smoke
  Scenario: Añadir una tarea a un Proyecto
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/task.json
    When execute method POST
    Then the status code should be 401

  @AddTaskError404 @Smoke
  Scenario: Añadir una tarea a un Proyecto
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/task
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/task.json
    When execute method POST
    Then the status code should be 404

  @GetTasksError405 @Smoke
  Scenario: Encontrar las tareas de un Proyecto
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/NoID/projects/{{projectId}}/tasks
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method DELETE
    Then the status code should be 405


  @GetTasksError401 @Smoke
  Scenario: Encontrar las tareas de un Proyecto
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00jMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 401

  @GetTasksError404 @Smoke
  Scenario: Encontrar las tareas de un Proyecto
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspace/{{workspaceId}}/projects/{{projectId}}/tasks
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @UpdateTaskError405 @Smoke
  Scenario: Modificar una tarea de un Proyecto
    Given call Clockify.feature@GetTasks
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/NoID/tasks/{{taskId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/taskupdate.json
    When execute method PATCH
    Then the status code should be 405

  @UpdateTaskError401 @Smoke
  Scenario: Modificar una tarea de un Proyecto
    Given call Clockify.feature@GetTasks
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLMtMzhkZDliYjNlNjE2
    And body jsons/bodies/taskupdate.json
    When execute method PUT
    Then the status code should be 401

  @UpdateTaskError404 @Smoke
  Scenario: Modificar una tarea de un Proyecto
    Given call Clockify.feature@GetTasks
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/project/{{projectId}}/tasks/{{taskId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/taskupdate.json
    When execute method PUT
    Then the status code should be 404

  @DeleteTaskError400 @Smoke
  Scenario: Eliminar una tardea de un Proyecto
    Given call Clockify.feature@GetTasks
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/NoID
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method PUT
    Then the status code should be 400

  @DeleteTaskError401 @Smoke
  Scenario: Eliminar una tardea de un Proyecto
    Given call Clockify.feature@GetTasks
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tasks/{{taskId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZW
    When execute method DELETE
    Then the status code should be 401

  @DeleteTaskError404 @Smoke
  Scenario: Eliminar una tardea de un Proyecto
    Given call Clockify.feature@GetTasks
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/tks/{{taskId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method DELETE
    Then the status code should be 404