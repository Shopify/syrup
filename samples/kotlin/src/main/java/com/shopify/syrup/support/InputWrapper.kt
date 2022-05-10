/*
 * Syrup auto-generated support file.
 * Do not Modify this file manually.
 */
package com.shopify.syrup.support
import javax.annotation.Generated

@Generated("com.shopify.syrup")
class InputWrapper<T>() {
    var value: T? = null
        set(value) {
            isDefined = true
            field = value
        }

    var isDefined = false
        private set

    constructor(t: T?) : this() {
        this.value = t
        this.isDefined = true
    }

    override fun equals(other: Any?): Boolean {
        return (other as? InputWrapper<*>)?.let {
            it.value == value
        } ?: false
    }

    override fun hashCode(): Int {
        return this.value?.hashCode() ?: 0
    }

    override fun toString(): String {
        return value.toString()
    }
}
