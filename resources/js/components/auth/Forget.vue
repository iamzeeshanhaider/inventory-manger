<template>
    <div>
        <div class="row justify-content-center">
            <div class="col-xl-5 col-lg-5 col-md-5">
                <div class="card shadow-sm my-5">
                    <div class="card-body p-0">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="login-form">
                                    <div class="text-center">
                                        <h1 class="h4 text-gray-900 mb-4">
                                            Forget Password
                                        </h1>
                                    </div>
                                    <form class="user">
                                        <div class="form-group">
                                            <input
                                                type="email"
                                                class="form-control"
                                                id="exampleInputEmail"
                                                aria-describedby="emailHelp"
                                                placeholder="Enter Register Email Address"
                                            />
                                        </div>
                                        <div class="form-group">
                                            <a
                                                href="index.html"
                                                class="btn btn-primary btn-block"
                                                >Forget Password</a
                                            >
                                        </div>
                                        <hr />
                                        <!-- <a
                                            href="index.html"
                                            class="btn btn-google btn-block"
                                        >
                                            <i class="fab fa-google fa-fw"></i>
                                            Login with Google
                                        </a>
                                        <a
                                            href="index.html"
                                            class="btn btn-facebook btn-block"
                                        >
                                            <i
                                                class="fab fa-facebook-f fa-fw"
                                            ></i>
                                            Login with Facebook
                                        </a> -->
                                    </form>
                                    <div class="text-center">
                                        <router-link
                                            class="font-weight-bold small"
                                            to="/"
                                            >Back to Login</router-link
                                        >
                                    </div>
                                    <div class="text-center"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>
<script>
export default {};
</script>
<style></style>
