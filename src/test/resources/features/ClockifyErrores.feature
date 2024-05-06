@ClockifyErrores
Feature: Caminos de error de TP4 Clockify

  @GetWorkspaceError400 #Reemplazar GET por POST
  Scenario: Obtener los Workspace
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspaces
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method POST
    Then the status code should be 400

  @GetWorkspaceError401 #Api key erronea
  Scenario: Obtener los Workspace
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspaces
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE
    When execute method GET
    Then the status code should be 401

  @GetWorkspaceError404 #Endpoint erroneo
  Scenario: Obtener los Workspace
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspace
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @NewProjectError400 #Nombre de proyecto ya existe
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

  @NewProjectError401 #Error en el nombre de la Api key
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

  @NewProjectError404 #Endpoint erroneo
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

  @GetProjectsError400 #Reemplazar GET por POST
  Scenario: Buscar los todos proyectos en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method POST
    Then the status code should be 400

  @GetProjectsError401 #Api key erronea
  Scenario: Buscar los todos proyectos en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZT
    When execute method GET
    Then the status code should be 401

  @GetProjectsError404 #Endpoint erroneo
  Scenario: Buscar los todos proyectos en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/project
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @FindProjectError400 #ProjectId incorrecto
  Scenario: Encontrar un proyecto por ID en el Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/Hola,soyElProjectId
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 400

  @FindProjectError401 #Sin Api key
  Scenario: Encontrar un proyecto por ID en el Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method GET
    Then the status code should be 401

  @FindProjectError404 #Endpoint erroneo
  Scenario: Encontrar un proyecto por ID en el Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/project/{{projectId}}
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    When execute method GET
    Then the status code should be 404

  @ModifyProjectError400 #Endpoint erroneo
  Scenario: Modificar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/SoyUnID/memberships
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/modify.json
    When execute method PATCH
    Then the status code should be 400

  @ModifyProjectError401 #Sin Api key
  Scenario: Modificar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/memberships
    And header Content-Type = application/json
    And header Accept = */*
    And body jsons/bodies/modify.json
    When execute method PATCH
    Then the status code should be 401

  @ModifyProjectError404 #Endpoint erroneo
  Scenario: Modificar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/members
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2
    And body jsons/bodies/modify.json
    When execute method PATCH
    Then the status code should be 404