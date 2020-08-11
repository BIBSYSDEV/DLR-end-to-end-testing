import { Given, When, Then } from 'cypress-cucumber-preprocessor/steps';
import DLRMainPage from '../../pages/DLRMainPage'

Given('a User is on the "front" page', () => {
    DLRMainPage.visit();
});

When('they type a Query in the "search" field they click Search', () => {
    DLRMainPage.typeQuery("test");
    DLRMainPage.pressSearch();
});

Then('they see a Result List of Resources', () => {
    cy.url().should('include', '/search');
});
