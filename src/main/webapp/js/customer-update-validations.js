
function validation(form) {
    const salutation = $('#salutation').val();
    const firstName = $('#firstName').val();
    const lastName = $('#lastName').val();
    const nationality = $('#nationality').val();
    const nativeRegion = $('#nativeRegion').val();
    const countryOfBirth = $('#countryOfBirth').val();
    const countryOfResidence = $('#countryOfResidence').val();
    const gender = $('#gender').val();
    const primaryMobileNumber = $('#primaryMobileNumber').val();
    const emailId = $('#emailId').val();
    
    const currentBuildingName = $('#currentBuildingName').val();
    const currentStreetName = $('#currentStreetName').val();
    const currentLandmark = $('#currentLandmark').val();
    const currentCity = $('#currentCity').val();
    const currentDistrict = $('#currentDistrict').val();
    const currentCountry = $('#currentCountry').val();
    const stateDropdown = $('#stateDropdown').val();
    const currentZip = $('#currentZip').val();
   
    
    const annualIncomeRangeId = $('#annualIncomeRangeId').val();
    const annualIncomeCurrencyCode = $('#annualIncomeCurrencyCode').val();
    const riskRatingId = $('#riskRatingId').val();
    const incomeType = $('#incomeType').val();
    const professionCategory = $('#professionCategory').val();
    const employerName = $('#employerName').val();
    const employerAddress = $('#employerAddress').val();
    const employerPhone = $('#employerPhone').val();
    const txnVolMonth = $('#txnVolMonth').val();
    const txnCountMonth = $('#txnCountMonth').val();
    const firstLanguage = $('#firstLanguage').val();
    const maritalStatus = $('#maritalStatus').val();

    let isValid = true;

    $(".error").text('');

    if (!salutation) {
        $('#salutationError').text('Salutation is required');
        isValid = false;
    }

    if (!firstName) {
        $('#firstNameError').text('First Name is required');
        isValid = false;
    }

    if (!lastName) {
        $('#lastNameError').text('Last Name is required');
        isValid = false;
    }

    if (!nationality) {
        $('#nationalityError').text('Nationality is required');
        isValid = false;
    }

    if (!nativeRegion) {
        $('#nativeRegionError').text('Native Region is required');
        isValid = false;
    }

    if (!countryOfBirth) {
        $('#countryOfBirthError').text('Country of Birth is required');
        isValid = false;
    }

    if (!countryOfResidence) {
        $('#countryOfResidenceError').text('Country of Residence is required');
        isValid = false;
    }

    if (!gender) {
        $('#genderError').text('Gender is required');
        isValid = false;
    }
    if (!emailId) {
        $('#emailIdError').text('Email ID is required');
        isValid = false;
    } else if (!/^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/.test(emailId)) {
        $('#emailIdError').text('Invalid email format');
        isValid = false;
    }

    if (!currentBuildingName) {
        $('#buildingNameError').text('Building Name is required');
        isValid = false;
    }
    if (!currentStreetName) {
        $('#streetNameError').text('Street Name is required');
        isValid = false;
    }
    if (!currentLandmark) {
        $('#landmarkError').text('Landmark is required');
        isValid = false;
    }
    if (!currentCity) {
        $('#cityError').text('City is required');
        isValid = false;
    }
    if (!currentDistrict) {
        $('#districtError').text('District is required');
        isValid = false;
    }
    if (!currentCountry) {
        $('#countryError').text('City is required');
        isValid = false;
    }
    if (!stateDropdown) {
        $('#stateError').text('State is required');
        isValid = false;
    }
    if (!currentZip) {
        $('#zipError').text('Zip is required');
        isValid = false;
    }
    if (!annualIncomeRangeId) {
        $('#annualIncomeRangeIdError').text('Annual Income Range is required');
        isValid = false;
    }
    if (!annualIncomeCurrencyCode) {
        $('#annualIncomeCurrencyCodeError').text('annual Income Currency Code is required');
        isValid = false;
    }
    if (!riskRatingId) {
        $('#riskRatingIdError').text('Risk Rating Id is required');
        isValid = false;
    }
    if (!incomeType) {
        $('#incomeTypeError').text('Income Type is required');
        isValid = false;
    }
    if (!professionCategory) {
        $('#professionCategoryError').text('Profession Category is required');
        isValid = false;
    }
    if (!employerName) {
        $('#employerNameError').text('Employer Name is required');
        isValid = false;
    }
    if (!employerAddress) {
        $('#employerAddressError').text('Employer Address is required');
        isValid = false;
    }
    if (!employerPhone) {
        $('#employerPhoneError').text('Employer Phone is required');
        isValid = false;
    }
    if (!txnVolMonth) {
        $('#txnVolMonthError').text('Transaction Volume Month is required');
        isValid = false;
    }
    if (!txnCountMonth) {
        $('#txnCountMonthError').text('Transaction Count Month is required');
        isValid = false;
    }
    if (!firstLanguage) {
        $('#firstLanguageError').text('First Language is required');
        isValid = false;
    }
    if (!maritalStatus) {
        $('#maritalStatusError').text('Marital Status is required');
        isValid = false;
    }
    if (!isValid) {
        document.getElementById("validationError").style.display = "block";
    }

    console.log("Validation result:", isValid);
    return isValid;
}