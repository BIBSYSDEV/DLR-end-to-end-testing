import {Given, When, Then} from 'cypress-cucumber-preprocessor/steps';
import DLRMainPage from '../../pages/DLRMainPage'

Given('a Curator is logged in', () => {
    cy.login_curator();
    cy.visit("/")
});

When('they click the menu', () => {
    cy.visit("/")
    //cy.getLocalStorage("token").should("equal", "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzUxMiIsInppcCI6IkRFRiJ9.eNpEzMsKgCAQheF3mXWGFdpl5atYikihoTMRRO_e7Np-_-E8UGmFBdBX3KhYzMVQitimDA3EWrm5o4hAUax2231y4sghJsPq_NX-Y0vuHxtubP4-Yel0P6lJ66HnR4sMah6lkgzvBwAA__8.QOc5cne9bb8sGNcgEqOPa5VWTYqsUlj0YUVdrBV-bRzqtvvjbzs8CQUgK4hgH43gRYxLkbyaSiO2n3HkGH-jZgKhpeBjM1drfbkJRyw7rNdDCiMiMocIlEc8kFFo9he8XY_gTST86deMgm6pA5sbasYuyaQdkmf3zMe3yX9lGyauMATMiLMkviNlj8mKd98hiGGxZguitvMbNmeUNiSdb7vJU4M8CQF78bmd3tNwSjIAXjyQuESwLq2PIl7pQzw41vm4Lb-GYYnYYHqPx7z-LGKzBmSPc4uFVfuatA0WeY2TG6hNZ_kmygnP9WYXItlRx4Dl-VShb38t-Za-w1cqD8TbZzGkGrtnNK3-DniT1NbaAosYTrT9owBIMOaGTQ3Ui0H6SRTtiZdkeGKbCH25VdisxULaQTq9Mpcbk9W1PpxLcI685p71kIMsuJmBnHUtgZ-v1KdmZWG8ahfp0zpdC_saErlmf2IeWzO0uUNVYANiFI0o_dWuwifDX6SUHKcqccdKVRgCC_q1jH8kJQaYUjd8wYCmDgpIN4AGLt1VAUUK4tN3KgRN9lqlLxVaZxA-2u-GgEP9jtOvZLZ_2qwBPXNbrxZz4Mqemgaq0SbNheWFxfOoClmUQ2Dp_Uy1ihqXh-zuXu82wGJ2MwXqCnsJdt-NiJv1-BZtHMeHC951MqQ");
    DLRMainPage.pressMenu();
});

When('they click the "profile" menu item', () => {
    DLRMainPage.pressProfileLink();
});

Then('they are routed to the "profile" page', () => {
    cy.url().should('include', '/user');
});

Then('the profile page contains a "roles" table with the text "Curator"', () => {
    cy.get('.roleHolder').contains( 'Kurator') //todo: language-independant
});

