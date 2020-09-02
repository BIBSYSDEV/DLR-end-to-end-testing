import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';

const TEST_QUERY = "test"

//Scenario: A User enters a Query in the "search" field
Given('a User is on the "front" page', () => {
    cy.visit('/');
});

When('they type a Query in the "search" field and click Search', () => {
    cy.get(`[data-testid=search_form]`).type(TEST_QUERY);
    cy.get(`[data-testid=search_form]`).submit();
});

Then('they see the Query in the "search" Field', () => {
    cy.get(`[data-testid=search_form] input`).should('have.value', TEST_QUERY);
});

Then('they see a Result List of Resoures', () => {
    cy.get(`[data-testid=result_list_item_desktop]`).its('length').should('be.gte', 1);
});

Then('they see options to sort by Filter', () => {
    cy.contains("Filter");
});

Then('they see options to view by View Mode', () => {
    cy.get(`[data-testid=list_view_button]`);
});
