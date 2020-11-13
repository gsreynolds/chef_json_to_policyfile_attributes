# Chef JSON to Policyfile Attributes

Bulk conversion of Role and Environment file `default_attributes` and `override_attributes` into Chef Ruby attribute syntax that can be dumped into a Policyfile

```bash
chef exec ruby jsontorb.rb roles/example1.json | tee -a test-policy.rb
chef exec ruby jsontorb.rb environments/dev.json  | tee -a test-policy.rb
chef exec ruby jsontorb.rb environments/prod.json  | tee -a test-policy.rb
```

For environment files, attributes are prefixed with the environment name for Policyfile Attribute Hoisting based on Policy Group.
