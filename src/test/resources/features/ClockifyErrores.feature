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
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/modify.json
    When execute method PUT
    Then the status code should be 404