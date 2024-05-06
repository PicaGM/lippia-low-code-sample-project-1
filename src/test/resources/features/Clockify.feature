@Clockify
Feature: Comprobar el funcionamiento de API Clockify

  Background:
    And header Content-Type = application/json
    And header Accept = */*
    And header x-api-key = YTI4ZWMzYzAtNmNhMS00ZTllLWJjMzMtMzhkZDliYjNlNjE2

  @GetWorkspace
  Scenario: Obtener los Workspace
    Given base url https://api.clockify.me
    And endpoint /api/v1/workspaces
    When execute method GET
    Then the status code should be 200
    * define workspaceId = $.[0].id

  @NewProject
  Scenario: Crear un nuevo proyecto en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    And body jsons/bodies/project.json
    When execute method POST
    Then the status code should be 201

  @GetProjects
  Scenario: Buscar los todos proyectos en el Workspace
    Given call Clockify.feature@GetWorkspace
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects
    When execute method GET
    Then the status code should be 200
    * define projectId = $.[0].id

  @FindProject
  Scenario: Encontrar un proyecto por ID en el Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}
    When execute method GET
    Then the status code should be 200

  @ModifyProject
  Scenario: Modificar un proyecto del Workspace
    Given call Clockify.feature@GetProjects
    And base url https://api.clockify.me/api
    And endpoint /v1/workspaces/{{workspaceId}}/projects/{{projectId}}/memberships
    And body jsons/bodies/modify.json
    When execute method PATCH
    Then the status code should be 200
    * validate response should be $.memberships[0].hourlyRate.amount = 6