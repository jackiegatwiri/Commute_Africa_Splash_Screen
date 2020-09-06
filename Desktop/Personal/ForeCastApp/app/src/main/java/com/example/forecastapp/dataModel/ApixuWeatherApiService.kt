package com.example.forecastapp.dataModel

import com.example.forecastapp.dataModel.response.CurrentWeatherResponse
import com.jakewharton.retrofit2.adapter.kotlin.coroutines.CoroutineCallAdapterFactory
import kotlinx.coroutines.Deferred
import okhttp3.Interceptor
import okhttp3.OkHttpClient
import retrofit2.Retrofit
import retrofit2.converter.gson.GsonConverterFactory
import retrofit2.http.GET
import retrofit2.http.Query

const val API_KEY = "51bc90f8fe1dcc1b2eceae051c067f6f"

//http://api.apixu.com/v1/current.json?key=89e8bd89085b41b7a4b142029180210&q=London&lang=en

interface ApixuWeatherApiService {

    @GET("current")
    fun getCurrentWeather(
        @Query("query") location: String,
        @Query("lang") languageCode: String = "en"
    ): Deferred<CurrentWeatherResponse>


//    // https://api.apixu.com/v1/forecast.json?key=89e8bd89085b41b7a4b142029180210&q=Los%20Angeles&days=1
//    @GET("forecast.json")
//    fun getFutureWeather(
//        @Query("q") location: String,
//        @Query("days") days: Int,
//        @Query("lang") languageCode: String = "en"
//    ): Deferred<FutureWeatherResponse>

    companion object {
        operator fun invoke(): ApixuWeatherApiService {
            val requestInterceptor = Interceptor { chain ->

                val url = chain.request()
                    .url()
                    .newBuilder()
                    .addQueryParameter("access_key", API_KEY)
                    .build()
                val request = chain.request()
                    .newBuilder()
                    .url(url)
                    .build()

                return@Interceptor chain.proceed(request)
            }

            val okHttpClient = OkHttpClient.Builder()
                .addInterceptor(requestInterceptor)
                .build()

            return Retrofit.Builder()
                .client(okHttpClient)
                .baseUrl("https://api.weatherstack.com/")
                .addCallAdapterFactory(CoroutineCallAdapterFactory())
                .addConverterFactory(GsonConverterFactory.create())
                .build()
                .create(ApixuWeatherApiService::class.java)
        }
    }
}