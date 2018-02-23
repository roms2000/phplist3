Feature: Manage admins
    In order to give other people access to my phpLIst Installation
    As an admin user
    I need to be able to add them, define right access, check people I have added and remove them

Scenario: Check options on the admin page
    Given I have logged in as an administrator
    When I follow "Config"
    Then I should see "Manage administrators"
    #And I follow "Manage administrators"
    #ElementNotClickable at point unknownexeption
    Given I am on "http://localhost/lists/admin/?page=admins"
    Then I should see "Add new admin"
    And I should see "Find an admin:"
    And I should see "Administrators"
    And I should see "Import list of admins"

Scenario: Add New Admin as super admin
    Given I have logged in as an administrator
    When I follow "Config"
    #When I follow "Configuration"
    #Then I should see "Configuration steps"
    #When I follow "Settings"
    #Then I should see "general settings"
    Then I should see "Manage administrators"
    #And I follow "Manage administrators"
    #ElementNotClickable at point unknownexeption
    #step below it's a work around
    Given I am on "http://localhost/lists/admin/?page=admins" 
    And I follow "Add new admin"
    Then I should see "List of administrators"
    And I should see "Add a new administrator"
    Given I fill in "loginname" with "subadmin1"
    And I fill in "email" with "sub@domain.com"
    And I select "No" from "superuser"
    And I select "No" from "disabled"
    And I check "Manage subscribers"  
    #And I check "Send campaigns"
    And I check "View statistics"
    #And I check "Change settings"
    When I press "Save changes"
    Then I should see "Edit administrator: subadmin1"
    #Given I am on "http://localhost/lists/admin/?page=logout"
    #When I follow "Logout"
  
  Scenario: Login as subadmin
    Given I am on "http://localhost/lists/admin/?page=home"
    And I fill in "login" with "subadmin1"
    And I fill in "password" with "subadmin"
    Then I should see "Subscribers"
    And I should not see "Campaigns"








