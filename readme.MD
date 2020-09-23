# Feature-descriptions and end to end tests for DLR

This project contains feature-descriptions of the DLR application.

The features are written using Gherkin-syntax and is coupled to end-to-end tests. Jira-stories should reference to the corresponding feature.

##Usage

Run tests with 

    npm run test

To test a single feature (example): 

    npx cypress run --spec cypress/integration/curatorCommunication.feature

To run locally tests (with GUI): 

    CYPRESS_BASE_URL=http://localhost:9999/ npx cypress open


##Requirements:

Add a cypress.env.json-file with the content:
```
{
  "CURATOR_TOKEN": "<jwt token for test user with curator role>"
  "PUBLISHER_TOKEN": "<jwt token>",
  "ADMINISTRATOR_TOKEN": "<jwt token>",
  "EDITOR_TOKEN": "<jwt token>"
}
```

```
The .feature file will use steps definitions from a directory with the same name as your .feature file. The javascript files containing the step definitions can have other names if you want to break them into different concerns
We also have a way to create reusable step definitions. Put them in cypress/integration/common/
```
