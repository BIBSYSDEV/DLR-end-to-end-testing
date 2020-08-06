describe('Main page', function () {

    beforeEach(() => {
        cy.visit('/');
        cy.server();
    });

    it("searches on frontpage and get hits", () => {
        cy.get('#searchform input').type("test");
        cy.get('#searchform').submit();
        cy.url().should('include', '/resources');
        //cy.get('.hitcounter');
    })

    it("opens the detailed page when pressing on the first thumbnail", () => {
        cy.get('.gridViewItemWrapper a.thumbnail').first().click();
        cy.url().should('include', '/content');
        // cy.contains('https://hdl.handle.net/');
    })

    it("switches language", () => {
        cy.get('button[t="logIn"').contains("Logg inn");
        cy.get('.languageselector a').click();
        cy.get('button[t="logIn"').contains("Log in");
    })

});
