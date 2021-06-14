#![feature(naked_functions)]
#![feature(asm)]

#![no_std]
#![no_main]

#[panic_handler]
fn on_panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}

#[naked]
#[no_mangle]
pub unsafe extern "C" fn start() -> ! {
    asm!(
        "li     ra, 0xffff0020",
        "jr     ra", 
        options(noreturn)
    )
}
