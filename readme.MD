# Cypress test for DLR (E2E)

Requirements:

Add a cypress.env.json-file with the content:
```
{
  "CURATOR_TOKEN": "<jwt token for test user with curator role>"
}
```

We use cypress-cucumber-preprocessor : https://github.com/TheBrainFamily/cypress-cucumber-preprocessor

```
The .feature file will use steps definitions from a directory with the same name as your .feature file. The javascript files containing the step definitions can have other names if you want to break them into different concerns
We also have a way to create reusable step definitions. Put them in cypress/integration/common/
```

(this project is inspired by https://medium.com/@itortv/how-to-integrate-cypress-and-cucumber-in-your-development-flow-in-just-a-few-weeks-96a46ac9165a)