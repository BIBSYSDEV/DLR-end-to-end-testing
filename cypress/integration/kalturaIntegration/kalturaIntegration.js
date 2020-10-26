import {Given, When, Then} from 'cypress-cucumber-preprocessor/steps';
import '@testing-library/cypress/add-commands';
import 'cypress-file-upload';

Cypress.on('uncaught:exception', (err, runnable) => {
    return false;
});

//--------------------------------------------
//Scenario: All videos published in DLR by Kaltura-affiliated users should also be published in Kaltura
Given('A publisher who is affiliated with institutions who use Kaltura is logged in', () => {
    cy.login_kaltura_publisher();
});
Given('starts a registration', () => {
    cy.findByText(/ny registrering/i).click();
});
Given('registers a video', () => {
    cy.get('input[type="file"]').attachFile('testvideo.mov');
    cy.wait(2000);
    cy.findByText(/opprett/i).click();
    cy.wait(8000);
    cy.findByText('Lagring fullført').should('exist');
});

When('they perform the publication', () => {
    cy.get('#title').type('Bildetittel');
    cy.get('#groupLicenseQuestion1').check();
    cy.get('#groupLicenseQuestion2').check();
    cy.get('#allLicenses').check();
    cy.get('button[type="submit"]').click();
    cy.wait(2000);
    cy.waitFor('Ikke publisert');
    cy.get('button.btn-primary').click()
});

Then('the video is published in DLR', () => {
    cy.findByText(/Publisert med/i).should('exist');
});

When('they open the resource content tab', () => {
    cy.findByText('Innhold').click();
});

Then('the Kaltura video has the correct embedding data', () => {
    cy.findByText('video-service/x-kaltura').should('exist');
});

//--------------------------------------------
// Scenario: A user can view Kaltura videos who have been published from or imported in DLR
When('A user views a Kaltura video resource', () => {
    cy.visit('/resources/b711a13b-389c-41f2-93aa-a3dc160b15c0/content');
});

//--------------------------------------------
// Scenario: A Publisher can publish a video in DLR from Kaltura link
Given('A publisher is logged in', () => {
    cy.login_publisher();
});
Given('registers a link to Kaltura', () => {
    cy.get('tabnav').findByText("Lenke").click();
    cy.findByPlaceholderText(/lenke/i).type('https://kaltura.no/jdsakjdsalkd');
    cy.findByText(/Velg/i).click();
    //TODO: Skriv inn en riktig Kaltura-lenke og trykk på 'opprett'-knappen
});

When('they open the newly published resource', () => {
});

Then('a Kaltura URL is shown in the section for generated content', () => {
});
Then('has the correct embedding data', () => {
});

//--------------------------------------------
// Scenario: A Kaltura-affiliated publisher can view a list of their own Kaltura videos in DLR
When('they click on the tab named Kaltura', () => {
    cy.findByText(/Kaltura/i).click();
});

Then('they see a list of all the videos in Kaltura that they own', () => {
    cy.findByText(/ditt kaltura-innhold/i).should('exist');
    cy.findByText(/søker/i).should('not exist');
});
Then('each video that has not already been published in DLR has an import button next to it', () => {
});
Then('the videos that are already published in DLR are not importable', () => {
});

//--------------------------------------------
//Scenario: A Kaltura-affiliated publisher can publish a video from list of their own Kaltura videos in DLR
When('click the import button on a Kaltura video from the list', () => {
    cy.findAllByText(/importer/i).first().click();
});