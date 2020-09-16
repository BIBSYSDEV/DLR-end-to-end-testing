import {Before, Given, Then, When} from 'cypress-cucumber-preprocessor/steps';

const SAMPLE_RESOURCE_PAGE = 'resources/7fad98bd-1d30-40e3-a72d-fa6aef1c871e/content';
const PUBLISHER_EMAIL = 'testtest@unit.no';

Before(() => {
    //TODO: Create a resource owned by the publisher
});

//Scenario: A Publisher opens "contact curator" form
Given('A Publisher is logged in', () => {
    cy.login_curator();
});

Given('they are on the "detail" page for a resource they own', () => {
    cy.visit(SAMPLE_RESOURCE_PAGE);
});

When('they press the "contact curator" button', () => {
    cy.get('[data-testid=requestCommunicationWithCurator]').click();
});

Then('they see a form where they can fill in a message', () => {
    cy.get(`[data-testid=requestCommunicationWithCuratorForm]`);
    cy.get(`[data-testid=requestCommunicationWithCuratorForm] #comment`);
});

Then('they see their email is filled in', () => {
    cy.get('[data-testid=requestCommunicationWithCuratorForm] input').should('have.value', PUBLISHER_EMAIL);
});

