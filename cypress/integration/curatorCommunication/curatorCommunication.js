import {Before, Given, Then, When} from 'cypress-cucumber-preprocessor/steps';
import {v4 as uuidv4} from 'uuid';

const TEST_RESOURCE_ID = '2ee4177a-06ca-4883-8343-16670fad3e1a';
const PUBLISHER_EMAIL = 'testtest@unit.no';
const UNIQUE_MESSAGE = uuidv4();
const RESOURCE_PAGE = `resources/${TEST_RESOURCE_ID}/content`;
const CONTACT_PAGE = `resources/${TEST_RESOURCE_ID}/requestCommunicationWithCurator`;
const CURATOR_WORKLIST_PAGE = '/worklists/curator';

Before(() => {
    //TODO: Create a resource owned by the publisher
});

//--------------------------------------------
//Scenario: A Publisher opens "contact curator" form
Given('A Publisher is logged in', () => {
    cy.login_publisher();
});
Given('they are on the "detail" page for a resource they own', () => {
    cy.visit(RESOURCE_PAGE);
});
When('they press the "contact curator" button', () => {
    cy.get('[data-testid=requestCommunicationWithCurator]').click();
});
Then('they see a form where they can fill in a message', () => {
    cy.get(`[data-testid=requestCommunicationWithCuratorForm]`);
    cy.get(`[data-testid=requestCommunicationWithCuratorForm] #comment`);
});
Then('they see their email is filled in', () => {
    cy.get('#email').should('have.value', PUBLISHER_EMAIL);
});

//--------------------------------------------
// Scenario: A Publisher sends request to curator
Given('A Publisher has opened "contact curator" form', () => {
    cy.login_publisher();
    cy.visit(CONTACT_PAGE);
});
Given('they fill inn a message', () => {
    cy.get('#comment').type(UNIQUE_MESSAGE);
});
When('they submit the form', () => {
    cy.get('[data-testid=requestCommunicationWithCuratorForm] button').click();
});
Then('the see a receipt', () => {
    cy.get('.alert-success')
});

//--------------------------------------------
// Scenario: A Publisher sends request to curator
Given('A Publisher has opened "contact curator" form', () => {
    cy.login_curator();
    cy.visit(CONTACT_PAGE);
});
Given('they fill inn a message', () => {
    cy.get('#comment').type("testString");
});
When('they submit the form', () => {
    cy.get('[data-testid=requestCommunicationWithCuratorForm] button').click();
});
Then('the see a receipt', () => {
    cy.get('.alert-success')
});

//--------------------------------------------
//Scenario: A Curator sees a communication request with a publisher
Given('A Curator is logged in', () => {
    cy.login_curator();
});
Given('a publisher has sent a contact request', () => {
    // NB! Should be set via API-calls in the before-statement
    // Instead we assume that the communication request from the above scenarios exists in the worklist
});
When('they navigate to on the "worklist" page', () => {
    cy.visit(CURATOR_WORKLIST_PAGE);
});
Then('they see a request from a publisher in the request list containing submitters email, comment, resource, delete button, respond in email program button', () => {
    //NB! not possible to extract parent element as parameter.
    cy.get(`[data-testid="contactRequestTable"]`).contains(UNIQUE_MESSAGE).parent().parent().find("[data-testid=submitter]").contains(PUBLISHER_EMAIL);
    cy.get(`[data-testid="contactRequestTable"]`).contains(UNIQUE_MESSAGE).parent().parent().find("[data-testid=deleteButton]");
    cy.get(`[data-testid="contactRequestTable"]`).contains(UNIQUE_MESSAGE).parent().parent().find("[data-testid=sendEmailLink]");
    cy.get(`[data-testid="contactRequestTable"]`).contains(UNIQUE_MESSAGE).parent().parent().find("[data-testid=openResourceLink]");
});
Then('they see that the request list is sorted chronologically', () => {
    //TODO. Implement better test. For now this is covered by the previous test-statement
});

//--------------------------------------------
//  A Curator triggers a communication request with a publisher
Given('A Curator sees a communication request from a publisher', () => {
    cy.login_curator();
    cy.visit(CURATOR_WORKLIST_PAGE);
    cy.get(`[data-testid="contactRequestTable"]`).contains(UNIQUE_MESSAGE);
});
When('they  click the "respond in email program" button for the request', () => {
    cy.get(`[data-testid="contactRequestTable"]`).contains(UNIQUE_MESSAGE).parent().parent().find("[data-testid=sendEmailLink]");
    //NOT TESTABLE
});
When('their email-program is opened', () => {
    //NOT TESTABLE
});
Then('they see the subject, message and to-address is pre-filled in a draft email', () => {
    //NOT TESTABLE
});

//--------------------------------------------
//  Scenario: A Curator deletes a communication request with a publisher
Given('a Curator sees a communication request from a publisher', () => {
    cy.login_curator();
    cy.visit(CURATOR_WORKLIST_PAGE);
    cy.get(`[data-testid="contactRequestTable"]`).contains(UNIQUE_MESSAGE);
});
When('they  click the "delete" button for the request', () => {
    cy.get(`[data-testid="contactRequestTable"]`).contains(UNIQUE_MESSAGE).parent().parent().find("[data-testid=deleteButton]").click();
});
Then('they see the communication request is deleted from the request list', () => {
    cy.get(`[data-testid="contactRequestTable"]`).should('not.contain', UNIQUE_MESSAGE);
});
