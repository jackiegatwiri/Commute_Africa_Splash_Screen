package com.example.animalkotlinmvvm.viewModel

import androidx.lifecycle.MutableLiveData
import androidx.lifecycle.ViewModel
import com.example.animalkotlinmvvm.model.DogBreed

class DetailViewModel  : ViewModel(){
    val dogLiveData = MutableLiveData<DogBreed>()
    fun fetch(){
        val dog1 = DogBreed("1", "Corgi", "15 years", "breadGroup", "bradFor", "temp", "")
        dogLiveData.value = dog1

    }
}