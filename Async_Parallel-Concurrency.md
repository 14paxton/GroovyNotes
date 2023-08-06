### Example Using GPARS
https://gist.github.com/14paxton/b7ff93091f4db71beffb0a37140fa0f2
https://gist.github.com/14paxton/ef4f6e91fa7fa44015c41f26a1caf3ae

###  ASYNC
```groovy
 def resendRegistrationEmailAndLockUserAccount(def userList) {

        def emailsSent = []

        def emailsNotSent = []

        def nThreads = Runtime.getRuntime().availableProcessors()

        def size = (userList.size() / nThreads).intValue()

        def promises = []


        withPool nThreads, {

            userList.collate(size).each { subList ->

                def promise = task {

                    subList.each {userInstance ->

                        User.withTransaction {

                            def auth0Response = sendRegistrationEmail(userInstance)


                            if (auth0Response.type == "success")

                            {

                                emailsSent << userInstance.email

                                userInstance.inAdminResetProcess = true

                                userInstance.save(flush: true)

                                userInstance.setActive(true)

                            }

                            else

                            {

                                emailsNotSent << userInstance.email

                            }

                        }

                    }

                }

                promises.add(promise)

            }

            waitAll(promises)

        }


        return ["emailsSent" : emailsSent, "emailsNotSent" : emailsNotSent]

    }

``` 
