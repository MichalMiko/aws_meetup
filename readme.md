# Unique identifiers

```
export $(printf "AWS_ACCESS_KEY_ID=%s AWS_SECRET_ACCESS_KEY=%s AWS_SESSION_TOKEN=%s" \
$(aws sts assume-role \
--role-arn arn:aws:iam::441240919286:role/demo-role \
--role-session-name DemoSession \
--query "Credentials.[AccessKeyId,SecretAccessKey,SessionToken]" \
--output text))
```

```
aws sts get-caller-identity
```

```
aws iam list-attached-role-policies \
    --role-name demo-role
```

```
aws iam get-policy \
    --policy-arn arn:aws:iam::441240919286:policy/demo-policy
```

```
aws iam get-policy-version \
    --policy-arn arn:aws:iam::441240919286:policy/demo-policy \
    --version-id v2
```

```
aws iam set-default-policy-version \
    --policy-arn arn:aws:iam::441240919286:policy/demo-policy \
    --version-id v2
```

```
aws iam get-policy \
    --policy-arn arn:aws:iam::441240919286:policy/demo-policy
```    



# Resources
## Policy evaluation logic - AWS Docs:
https://docs.aws.amazon.com/IAM/latest/UserGuide/reference_policies_evaluation-logic.html



## AWS re:Inforce 2022:
IAM policy evaluation deep dive (IAM 433-R1)
https://d1.awsstatic.com/events/aws-reinforce-2022/IAM433_IAM-policy-evaluation-deep-dive.pdf

Blog post: https://ermetic.com/blog/aws/diving-deeply-into-iam-policy-evaluation-highlights-from-aws-reinforce-session-iam433/

Youtube IAM Policy Evaluation Series: policy evaluation chains | Amazon Web Services: https://www.youtube.com/watch?v=71-Gjo6a5Cs


## AWS re:Invent 2018: [REPEAT 1] Become an IAM Policy Master in 60 Minutes or Less (SEC316-R1)
https://www.youtube.com/watch?v=YQsK4MtsELU


IAM tests
https://github.com/awslabs/terraform-iam-policy-validator?tab=readme-ov-file
