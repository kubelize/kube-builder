# renovatebot 

When encoding for example a token use the following format:

```shell
echo -n 'your_token' | base64
```

This is important because -n makes sure to not include the '' in the encoded output