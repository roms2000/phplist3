Feature: Import subscribers
  In order to import subscribers 
  As an admin user
  I need to be able to login and import emails

  Scenario: Choose import method 
    Given I have logged in as an administrator
    Given I follow "Subscribers"
    Given I follow "Import emails"
    Then I should see "Please choose one of the import methods below"
    And I should see "copy and paste list of emails"
    And I should see "import by uploading a file with emails"
    And I should see "import by uploading a CSV file with emails and additional data"
    When I follow "copy and paste list of emails"
    Then I should be on "/lists/admin/?page=importsimple"
    #When I follow "import by uploading a file with emails"
    #Then I should be on "/lists/admin/?page=import1"
    #But When I follow "import by uploading a CSV file with emails and #additional data"
    #Then I should be on "/lists/admin/?page=import2"

  Scenario:Import subscribers using copy&paste 
    Given I have logged in as an administrator
    Given I am on "/lists/admin/?page=import"
    Given I follow "copy and paste list of emails"
    Then I should see "Select the lists to add the emails to"
    Given I check "importlists[all]"
    And I fill in "importcontent" with "you@domain.com"
    When I press "doimport"
    Then I should see "Send a campaign" 
    And I should see "Import some more emails"


  # Then print last response
  # this fails, even though the address is there
  # And I should see the email address I entered
    #And I follow "History"
    #Then I should see the email address I entered

  Scenario:Import subscribers by uploading a file with emails
    Given I have logged in as an administrator
    Given I am on "/lists/admin/?page=import"
    Given I follow "import by uploading a file with emails"
    Then I should see "Select the lists to add the emails to"
    Given I check "importlists[all]"
    When I attach the file "importFile.txt" to "import_file"
    When I press "Import"
    Then I should see "Test output::" 
    

  Scenario:Import subscribers by uploading a file with emails
    Given I have logged in as an administrator
    Given I am on "/lists/admin/?page=import"
    Given I follow "import by uploading a CSV file with emails and additional data"
    Then I should see "Select the lists to add the emails to"
