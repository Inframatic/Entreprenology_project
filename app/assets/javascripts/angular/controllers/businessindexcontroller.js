
function BusinessCtrl($scope) {
  $scope.hoveredCompany;
  $scope.hovering = false;

	$scope.firstInterviewList = [
		{firstinterview: 'yes'},
		{firstinterview: 'no'}
	];
    $scope.statusList = [ 
      {"renumeration": 'Paid' },
      {"renumeration": 'Volunteer' } ];
    $scope.companies = [
      {name:'Pizza Hut',industry:'Fun Industry', "renumeration": 'Volunteer', location: "New York", firstinterview: "yes", company_size: 100000, internship_info: "Grab your sword and fight the horde!", position_description: "You wil work. hard.", position_requirements: "Be smart", "keyworddescription": "After the Hamburglar was fired from McDonalds for burger theft, he invested 2.5 million dollars into the Fun industry and now it has become the booming Fun company you see today"},
      {name:'Heaven Inc.', industry:'Finance', "renumeration": 'Volunteer', location: "New York", firstinterview: "yes",  company_size: 1100, internship_info: "Lots of dancing", position_description: "You wil work. hard.", position_requirements: "Be smart", "keyworddescription": "I love money. Banks own everything, but who owns the bank? Heaven does bitches. I'm writing more so this box fills out."},
      {name:'Wood Sculptors North',industry:'Web Development', "renumeration": 'Paid', location: "Boston", firstinterview: "no",   company_size: 400, internship_info: "Lots of dancing", position_description: "You wil work. hard.", position_requirements: "Be semi-smart", "keyworddescription": "We make things look cool because people like cool stuff.If you shorten this decription, this box will get smaller. It's weird"},
      {name:'WeinerBlitzel',industry:'Corn Dogs', "renumeration": 'Paid', location: "Boston", firstinterview: "no",  company_size: 40, internship_info: "Lots of dancing", position_description: "You wil work. hard.", position_requirements: "Genius only", "keyworddescription": "Our hotdogs are the largest and firmest hotdogs in all the land. We protect each hotdog with a cushy breading" },
      {name:'Mcdonalds',industry:'Fun Industry', "renumeration": 'Volunteer', location: "New York", firstinterview: "yes", company_size: 100000, internship_info: "Grab your sword and fight the horde!", position_requirements: "Be smart", "keyworddescription": "After the Hamburglar was fired from McDonalds for burger theft, he invested 2.5 million dollars into the Fun industry and now it has become the booming Fun company you see today. Crazy yeah. I knew a guy who got that rich. His name was Jerry. Jerry was a dick though. Just goes to show you that rich people dont have to be good people."},
      {name:'Burger King', industry:'Finance', "renumeration": 'Volunteer', location: "New York", firstinterview: "yes",  company_size: 1100, internship_info: "Grab your sword and fight the horde!", position_requirements: "Just don't be too dumb", "keyworddescription": "I love money. Banks own everything, but who owns the bank? Heaven does bitches. I'm writing more so this box fills out."},
      {name:'Looking Good', industry:'Web Development', "renumeration": 'Paid', location: "Boston", firstinterview: "no",   company_size: 400, internship_info: "Lots of dancing", position_description: "You wil work. hard.", position_requirements: "Be semi-smart", "keyworddescription": "We make things look cool because people like cool stuff.If you shorten this decription, this box will get smaller. It's weird. So weird"},
      {name:'LeanerSchnitzel',industry:'Healthy Corn Dogs', "renumeration": 'Paid', location: "Boston", firstinterview: "no",  company_size: 40, internship_info: "Lots of dancing", position_description: "You wil work. hard.", position_requirements: "Just don't be too dumb", "keyworddescription": "Our hotdogs are the largest and firmest hotdogs in all the land. We protect each hotdog with a cushy breading. So tasty nom nom nom" }
    	];

    $scope.showDetails = function(company) {
      $scope.hoveredCompany = company;
      $scope.hovering = true;
    }
}


