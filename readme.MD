# Feature-descriptions and end to end tests for DLR

This project contains feature-descriptions of the DLR application.

The features are written using Gherkin-syntax and is coupled to end-to-end tests. Jira-stories should reference to the corresponding feature.

##Usage

Run tests with 
```
npm run test
```

##Requirements:

Add a cypress.env.json-file with the content:
```
{
  "CURATOR_TOKEN": "<jwt token for test user with curator role>"
}
```

```
The .feature file will use steps definitions from a directory with the same name as your .feature file. The javascript files containing the step definitions can have other names if you want to break them into different concerns
We also have a way to create reusable step definitions. Put them in cypress/integration/common/
```
