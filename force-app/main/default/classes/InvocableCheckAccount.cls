public with sharing class InvocableCheckAccount {
    public class VariablesInput {
        public VariablesInput() {}

        public VariablesInput(String cnpj) {
            this.cnpj = cnpj;
        }

        @InvocableVariable (required = true)
        public String cnpj;
    }

    public class VariablesOutput {
        public VariablesOutput() {}

        public VariablesOutput(Boolean hasAccount, String completedName, String email) {
            this.hasAccount = hasAccount;
            this.completedName = completedName;
            this.email = email;
        }

        @InvocableVariable (required = true)
        public Boolean hasAccount;
        
        @InvocableVariable (required = true)
        public String completedName;

        @InvocableVariable (required = true)
        public String email;
    }

    @InvocableMethod(label='Check account by CNPJ')
    public static List<VariablesOutput> checkAccountByDocument(List<String> cnpjInput) {

        List<Account> relatedAccounts = AccountSelector.getAccountsByCnpj(new Set<String>{StringUtils.noSpecialChar(cnpjInput.get(0))});

        List<VariablesOutput> output = new List<VariablesOutput>();

        if (relatedAccounts.isEmpty())
            output.add(
                new VariablesOutput(
                    false, 
                    null, 
                    null
                    )
            );

        if (!relatedAccounts.isEmpty())
            for (Account account : relatedAccounts)
                output.add(
                    new VariablesOutput(
                        true, 
                        account.Name, 
                        account.Email__c
                        )
                );

        return output;
    }

    public static List<VariablesInput> createInput(String cnpjInput) {
        return new List<VariablesInput> { new VariablesInput(cnpjInput) };
	}
}