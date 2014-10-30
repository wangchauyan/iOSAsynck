Implement AsyncTask class in iOS for using. 

Usage : 
- extend iOSAsyncK class 
- override [preExcute] [doInBackground] [postExecute] functions. 
  remember preExcute / postExecute are running on UI thread, doInBackground is running on other thread. 


Example :
``` 
otherTask.h 
@Interface otherTask : iOSAsyncK {
    NSArray* yourParamHere;
}

@end


otherTask.m
@implement otherTask 
- (void) preExcute {
}

- (id) doInBackground : (NSArray*) params {
    // download here for http operation 
    NSString* url = [NSString stringWithFormat:@"%@", yourURLString]; 
    NSString *respuesta;
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    NSUserDefaults *session = [NSUserDefaults standardUserDefaults];
    NSString *userName = [session stringForKey:@"userName"];
    [params setObject:userName forKey:@"username"];
    [params setObject:[NSString stringWithFormat:@"%d", [[chatsSinEnviar objectAtIndex:0] id]] forKey:@"id"];
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:[JSONParser wrapChatArray:chatsSinEnviar] options:0 error:&error];
    NSString *JSONString = [[NSString alloc] initWithBytes:[jsonData bytes] length:[jsonData length] encoding:NSUTF8StringEncoding];

    [params setObject:JSONString forKey:@"chats"];

    respuesta = [HTTPClient executePOST:url parameters:params];

    if([respuesta isEqualToString:@"true"]){
        return 1;
    }else{
        return -1;
    }
}


- (void) postExecute :(id) result{
    // do something here according to your result 
}
@end
```
